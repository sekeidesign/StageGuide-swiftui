//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI
import ActivityKit
import BackgroundTasks

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    //    @FetchRequest(sortDescriptors: []) var festival: FetchedResults<Festival>
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<Day>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "startTime <= %@ AND endTime >= %@", Date() as CVarArg, Date() as CVarArg)) var matchingDays: FetchedResults<Day>
    @State private var liveScheduleActivity: Activity<LiveScheduleAttributes>? = nil
    @State private var todayActs: [Act]?
    @State private var currentAct: Act?
    @State private var nextAct: Act?
    
    var body: some View {
        NavigationStack{
            TabView{
                EventInfoView()
                    .tabItem {
                        Label("Event info", systemImage: "music.note.house")
                    }
                FullScheduleView(days: days)
                    .tabItem {
                        Label("Full schedule", systemImage: "sparkles.rectangle.stack")
                    }
                YourScheduleView(days: days)
                    .tabItem {
                        Label("Your schedule", systemImage: "calendar")
                    }
            }
            .onAppear {
                let appearance = UITabBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.black.opacity(0.2))
                
                // Use this appearance when scrolling behind the TabView:
                UITabBar.appearance().standardAppearance = appearance
                // Use this appearance when scrolled all the way up:
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .onAppear {
            
            // check if today is equal to any [days]
            guard !matchingDays.isEmpty else {
                print("Today is not a festival day")
                return
            }
            
            guard liveScheduleActivity == nil else {
                return
            }
            // check if the festival has started but not ended yet
            let today = matchingDays[0]
            guard Date() >= today.startTime ?? Date() && Date() < today.endTime ?? Date() else {
                print("Festival hasn't started yet, or has already ended")
                return
            }
            print("Festival day has started")
            // Find act where now >= startTime && now < endTime
            let daysArray = days.compactMap { $0 as Day }.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()})
            todayActs = today.acts?.compactMap { $0 as? Act }.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()})
            currentAct = todayActs?.first(where: { act in
                act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
            })
            print("Current Act: \(String(describing: currentAct))")
            nextAct = getFollowingAct(currentAct: currentAct ?? Act(), todayActs: todayActs ?? [])
            
            
            // Start Live Activity
            liveScheduleActivity = startLiveActivity(currentAct: currentAct, nextAct: nextAct, days: daysArray)
            
            // Schedule first background task
            liveActivityRefresh(nextRefresh: nextAct?.startTime ?? Date().addingTimeInterval(60*45))
        }
//        .backgroundTask(.appRefresh("myapprefresh")) {
//            // Background task to refresh
//            // if currentAct is last item in today's Acts
//            if let index = todayActs.firstIndex(of: currentAct) {
//                if index == todayActs.count - 1 {
//                    print("The current item is the last item in the array.")
//                } else {
//                    print("The current item is not the last item in the array.")
//                }
//            } else {
//                print("The current item is not in the array.")
//            }
//            // schedule end Live Activity
//            // else
//            // update Live Activity with current and next act
//            // schedule next refresh
//        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

func getFollowingAct(currentAct: Act, todayActs: [Act]) -> Act? {
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

func startLiveActivity(currentAct: Act?, nextAct: Act?, days: [Day]) -> Activity<LiveScheduleAttributes>? {
    if ActivityAuthorizationInfo().areActivitiesEnabled {
        do {
            let today = LiveScheduleAttributes(festivalName: "Riverside", totalDays: days.count, todayCount: 1)
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

func updateActivity(currentActivity: Activity<LiveScheduleAttributes>?, newCurrentAct: String, newCurrentActStartTime: Date, nextAct: String, nextActStartTime: Date) async {
    guard let activity = currentActivity else {
        return
    }
    
    let newContent = LiveScheduleAttributes.ContentState(currentAct: newCurrentAct, currentActStartTime: newCurrentActStartTime, nextAct: nextAct, nextActStartTime: nextActStartTime)
    
    await activity.update(using: newContent)
}

func endActivity(currentActivity: Activity<LiveScheduleAttributes>?) async {
    guard let activity = currentActivity else {
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
