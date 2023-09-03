//
//  StageGuideApp.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI
import BackgroundTasks

class AppDelegate: NSObject, UIApplicationDelegate {
    let persistenceController = PersistenceController.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Has launched before: \(UserDefaults.standard.bool(forKey: "HasLaunchedBefore"))")
        
//        UserDefaults.standard.set(false, forKey: "HasLaunchedBefore")
        
        if !UserDefaults.standard.bool(forKey: "HasLaunchedBefore") {
            
            // Populate Core Data with initial data
            populateInitialData()
            
            UserDefaults.standard.set("Friday", forKey: "ActiveDay")
            UserDefaults.standard.set(true, forKey: "HasLaunchedBefore")
            UserDefaults.standard.set(true, forKey: "AreNotificationsEnabled")
            UserDefaults.standard.set(true, forKey: "AreLiveActivitiesEnabled")
            UserDefaults.standard.set(10, forKey: "NotificationTiming")
        }
        
        return true
    }
}

@main
struct StageGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
        
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                persistenceController.save()
            case .inactive:
                print("App inactive")
            case .active:
                print("App active")
            @unknown default:
                print("App phase unknown")
            }
        }
        .backgroundTask(.appRefresh("ca.sekei.StageGuide.liveActivityRefresh")) {
            // Background task to refresh
            // if currentAct is last item in today's Acts
//            if let index = todayActs.firstIndex(of: currentAct) {
//                if index == todayActs.count - 1 {
//                    print("The current item is the last item in the array.")
//                } else {
//                    print("The current item is not the last item in the array.")
//                }
//            } else {
//                print("The current item is not in the array.")
//            }
            // schedule end Live Activity
            // else
            // update Live Activity with current and next act
            // schedule next refresh
        }
    }
}
