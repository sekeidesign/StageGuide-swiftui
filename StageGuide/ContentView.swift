//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
//    @FetchRequest(sortDescriptors: []) var festival: FetchedResults<Festival>
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<Day>
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "startTime <= %@ AND endTime >= %@", Date() as CVarArg, Date() as CVarArg)) var matchingDays: FetchedResults<Day>
    
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
            
            // check if the festival has started but not ended yet
            let today = matchingDays[0]
            guard Date() >= today.startTime ?? Date() && Date() < today.endTime ?? Date() else {
                print("Festival hasn't started yet, or has already ended")
                return
            }
            print("Festival day has started")
            // Find act where now >= startTime && now < endTime
            let todayActs = today.acts?.compactMap { $0 as? Act }.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date()})
            let currentAct = todayActs?.first(where: { act in
                act.startTime ?? Date() <= Date() && act.endTime ?? Date() > Date()
            })
            let nextAct = getFollowingAct(currentAct: currentAct ?? Act(), todayActs: todayActs ?? [])
           
            
            // Start Live Activity
            startLiveActivity(currentAct: currentAct, nextAct: nextAct)
            
            // Background task to refresh
            // if currentAct is last item in today's Acts
            // schedule end Live Activity
            // else
            // update Live Activity with current and next act
            // schedule next refresh
        }
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
//                print("Next Act: \(nextAct)")
            } else {
                // There is no next item; you've reached the end of the array
                print("No next item in the array")
            }
        }
    return nextAct
}

func startLiveActivity(currentAct: Act?, nextAct: Act?) {
    if ActivityAuthorizationInfo().areActivitiesEnabled {
        do {
            let today = LiveScheduleAttributes(festivalName: "Riverside", totalDays: 3, todayCount: 1)
            let initialState = LiveScheduleAttributes.ContentState(currentAct: currentAct?.name ?? "No name", currentActStartTime: currentAct?.startTime ?? Date(), nextAct: nextAct?.name ?? "No name", nextActStartTime: nextAct?.startTime ?? Date())
            
            if #available(iOS 16.2, *) {
                let activity = try Activity.request(
                    attributes: today,
                    content: .init(state: initialState, staleDate: nil),
                    pushType: nil
                )
            } else {
                let activity = try Activity.request(attributes: today, contentState: initialState)
            }
            
            
        } catch {
            
            let errorMessage = """
                        Couldn't start activity
                        ------------------------
                        \(String(describing: error))
                        """
            
            print("\(errorMessage)")
        }
    }
}
