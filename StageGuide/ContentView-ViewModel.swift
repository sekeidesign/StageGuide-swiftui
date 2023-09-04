//
//  ContentView-ViewModel.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-09-03.
//

import Foundation
import ActivityKit
import CoreData

//extension ContentView {
    @MainActor class ContentViewModel: ObservableObject {
        @Published var days: [Day]?
        @Published var matchingDays: [Day]?
        @Published var todayActs: [Act]?
        @Published var currentAct: Act?
        @Published var nextAct: Act?
        @Published var liveScheduleActivity: Activity<LiveScheduleAttributes>?
        
        let container: NSPersistentContainer

        init() {
            container = NSPersistentContainer(name: "Riverside")
            container.loadPersistentStores { (description, error) in
                if let error = error {
                    fatalError("Error: \(error.localizedDescription)")
                }
            }
        }
        
        func loadData() {
            let daysRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
            let matchingDaysRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Day")
            let matchingDaysPredicate = NSPredicate(format: "startTime <= %@ AND endTime >= %@", Date() as CVarArg, Date() as CVarArg)
            matchingDaysRequest.predicate = matchingDaysPredicate
            
            do {
                days = try container.viewContext.fetch(daysRequest) as? [Day]
//                print(days)
                matchingDays = try container.viewContext.fetch(matchingDaysRequest) as? [Day]
//                print("Matching Days: \(matchingDays)")
            } catch {
                print("Fetch failed")
            }
        }
        
        private func getFollowingAct(currentAct: Act, todayActs: [Act]) -> Act? {
            var nextAct: Act?
            if let currentIndex = todayActs.firstIndex(where: { $0.id == currentAct.id }) {
                let nextIndex = currentIndex + 1
                if nextIndex < todayActs.count {
                    nextAct = todayActs[nextIndex]
                    // Now, `nextAct` contains the next item in the array
                    print("Next Act: \(String(describing: nextAct))")
                } else {
                    // There is no next item; you've reached the end of the array
                    print("No next item in the array")
                }
            }
            return nextAct
        }

        private func startLiveActivity(currentAct: Act?, nextAct: Act?, days: [Day], today: Day) -> Activity<LiveScheduleAttributes>? {
            if ActivityAuthorizationInfo().areActivitiesEnabled {
                let todayCount = days.firstIndex(of: today)! + 1
                
                do {
                    let today = LiveScheduleAttributes(festivalName: "Riverside", totalDays: days.count, todayCount: todayCount)
                    let initialState = LiveScheduleAttributes.ContentState(currentAct: currentAct?.name ?? "No name", currentActStartTime: currentAct?.startTime ?? Date(), nextAct: nextAct?.name ?? "No name", nextActStartTime: nextAct?.startTime ?? Date())
                    
                    if #available(iOS 16.2, *) {
                        let activity = try Activity.request(
                            attributes: today,
                            content: .init(state: initialState, staleDate: nil),
                            pushType: nil
                        )
                        return activity
                        
                    } else {
                        let activity = try Activity.request(attributes: today, contentState: initialState)
                        return activity
                    }
                    
                    
                } catch {
                    
                    let errorMessage = """
                                Couldn't start activity
                                ------------------------
                                \(String(describing: error))
                                """
                    
                    print("\(errorMessage)")
                    return nil
                }
            }
            return nil
        }

        private func updateActivity(newCurrentAct: String, newCurrentActStartTime: Date, newNextAct: String, newNextActStartTime: Date) async {
            guard let activity = liveScheduleActivity else {
                return
            }
            
            let newContent = LiveScheduleAttributes.ContentState(currentAct: newCurrentAct, currentActStartTime: newCurrentActStartTime, nextAct: newNextAct, nextActStartTime: newNextActStartTime)
            
            await activity.update(using: newContent)
        }

        private func endActivity() async {
            guard let activity = liveScheduleActivity else {
                return
            }
            
            let finalContent = LiveScheduleAttributes.ContentState(currentAct: "Get home safe!", currentActStartTime: Date(), nextAct: "See you next time!", nextActStartTime: Date().addingTimeInterval(60*60)
            )
            
            let dismissalPolicy: ActivityUIDismissalPolicy = .immediate
            
            if #available(iOS 16.2, *) {
                await activity.end(ActivityContent(state: finalContent, staleDate: nil), dismissalPolicy: dismissalPolicy)
            } else {
                await activity.end(using: finalContent, dismissalPolicy: dismissalPolicy)
            }
        }
        
        func initLiveActivity() {
            // check if today is equal to any [days]
            
            Timer.scheduledTimer(withTimeInterval: 200, repeats: false, block: { _ in print("Timer fired") })
            
            guard !(matchingDays?.isEmpty ?? false) else {
                print("Today is not a festival day")
                return
            }
            
            guard liveScheduleActivity == nil else {
                return
            }
                
            // check if the festival has started but not ended yet
            let today = matchingDays![0]
            print("Today: \(String(describing: today))")
            guard Date() >= today.startTime ?? Date() && Date() < today.endTime ?? Date() else {
                print("Festival hasn't started yet, or has already ended")
                return
            }
            print("Festival day has started")
            
            // Find act that is happening now
            let daysArray = days?.compactMap { $0 as Day }.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()})
            
            // Create an array of acts happening today
            guard let todayActs = today.acts?.compactMap({ $0 as? Act }).sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()}) else {
                print("No acts today")
                return
            }
            
            guard let currentAct = todayActs.first(where: { act in
                act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
            }) else {
                print("No acts live yet")
                return
            }
            print("Current Act: \(String(describing: currentAct))")
            
            nextAct = getFollowingAct(currentAct: currentAct, todayActs: todayActs)
            
            guard nextAct != nil else {
                print("No more acts after this")
                return
            }
            
            // Start Live Activity
            liveScheduleActivity = startLiveActivity(currentAct: currentAct, nextAct: nextAct, days: daysArray ?? [], today: today)
            
            // Schedule first background task
            liveActivityRefresh(nextRefresh: nextAct?.startTime ?? Date().addingTimeInterval(60*45))
        }
        
        func startNextAct() async {
            // Background task to refresh
            
            // If the current act is the last act, end the activity immediately
            if todayActs?.firstIndex(of: currentAct!) == todayActs!.count - 1 {
                await endActivity()
                return
            }

            // If the current act is the second last act, set the final act as "End" and schedule next refresh
            if todayActs?.firstIndex(of: currentAct!) == todayActs!.count - 2 {
                currentAct = todayActs!.first(where: { act in
                    act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
                })
                nextAct = getFollowingAct(currentAct: currentAct!, todayActs: todayActs!)
                print("New currentAct: \(String(describing: currentAct)), no more acts after this.")
                await updateActivity(newCurrentAct: (currentAct?.name)!, newCurrentActStartTime: (currentAct?.startTime)!, newNextAct: "End", newNextActStartTime: (currentAct?.endTime)!)
                liveActivityRefresh(nextRefresh: (currentAct?.endTime)!)
                return
            } else {
                // If the current act is not last or second last, set new current and next acts and schedule next refresh
                currentAct = todayActs!.first(where: { act in
                    act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
                })
                nextAct = getFollowingAct(currentAct: currentAct!, todayActs: todayActs!)
                await updateActivity(newCurrentAct: (currentAct?.name)!, newCurrentActStartTime: (currentAct?.startTime)!, newNextAct: (nextAct?.name)!, newNextActStartTime: (nextAct?.endTime)!)
                print("New currentAct: \(String(describing: currentAct)), new nextAct: \(String(describing: nextAct)).")
                liveActivityRefresh(nextRefresh: (currentAct?.endTime)!)
            }
        }
    }
//}
