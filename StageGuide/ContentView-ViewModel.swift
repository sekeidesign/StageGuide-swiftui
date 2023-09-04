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
    
#if DEBUG
//    let apiURL = "http://localhost:3000"
    let apiURL = "https://stageguide-server.onrender.com"
#else
    let apiURL = "https://stageguide-server.onrender.com"
#endif
    
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
                //                    print("Next Act: \(String(describing: nextAct))")
            } else {
                // There is no next item; you've reached the end of the array
                print("No next item in the array")
            }
        }
        return nextAct
    }
    
    private func startLiveActivity(currentAct: String, currentActStartTime: Date, nextAct: String, nextActStartTime: Date, days: [Day], today: Day) -> Activity<LiveScheduleAttributes>? {
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            let todayCount = days.firstIndex(of: today)! + 1
            
            do {
                let today = LiveScheduleAttributes(festivalName: "Riverside", totalDays: days.count, todayCount: todayCount)
                let initialState = LiveScheduleAttributes.ContentState(currentAct: currentAct, currentActStartTime: currentActStartTime, nextAct: nextAct, nextActStartTime: nextActStartTime)
                
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
    
    func initLiveActivity() {
        // check if today is equal to any [days]
        
        Timer.scheduledTimer(withTimeInterval: 200, repeats: false, block: { _ in print("Timer fired") })
        
        guard !(matchingDays?.isEmpty ?? false) else {
            print("Today is not a festival day")
            return
        }
        
        guard liveScheduleActivity == nil else {
            print("Live Activity is already active")
            return
        }
        
        // check if the festival has started but not ended yet
        let today = matchingDays![0]
        print("Today: \(String(describing: today))")
        // TO-DO: this check might be redundant since matchingDays already filters to check this
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
        
        // Find the act that's happening now
        guard let currentAct = todayActs.first(where: { act in
            act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
        }) else {
            print("No acts live yet")
            return
        }
        //            print("Current Act: \(String(describing: currentAct))")
        
        // Find the next acts
        nextAct = getFollowingAct(currentAct: currentAct, todayActs: todayActs)
        
        // If there are no more acts, start live activity and set the next act to end
        guard nextAct != nil else {
            print("No more acts after this")
            // Start Live Activity
            liveScheduleActivity = startLiveActivity(currentAct: currentAct.name!, currentActStartTime: currentAct.startTime!, nextAct: "End", nextActStartTime: currentAct.endTime!, days: daysArray ?? [], today: today)
            return
        }
        
        // Send lineup to server
        
        // Encode the lineup to JSON data
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        
        // Convert lineup to codable array
        let codableLineup = convertToLineup(todayActs)
        
        if let jsonData = try? encoder.encode(codableLineup) {
            // Step 4: Send the JSON data in an HTTP request
            // You can use URLSession to send the JSON data as part of your HTTP request
            // Example code to send the JSON data to a server:
            
            // Prepare URL
            let url = URL(string: "\(apiURL)/live_activity")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                    return
                } else if let data = data {
                    // Handle the response from the server if needed
                    let responseString = String(data: data, encoding: .utf8)
                    print("Response: \(responseString ?? "")")
                    // Start Live Activity
                }
            }
            task.resume()
            liveScheduleActivity = startLiveActivity(currentAct: currentAct.name!, currentActStartTime: currentAct.startTime!, nextAct: (nextAct?.name)!, nextActStartTime: (nextAct?.startTime)!, days: daysArray ?? [], today: today)
//            print("Started live activity")
        } else {
            print("Error encoding JSON data")
            return
        }
    }
    
    private func convertToLineup(_ acts: [Act]) -> [[String: String]] {
        return acts.map { act in
            let name = act.name ?? "No name"
            let startTime = dateToString(act.startTime ?? Date())
            let endTime = dateToString(act.endTime ?? Date())
            return ["name": name, "startTime": startTime, "endTime": endTime]
        }
    }
    
}
//}
