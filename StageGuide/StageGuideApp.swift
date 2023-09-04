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
                print("")
            case .active:
                print("")
            @unknown default:
                print("")
            }
        }
        .backgroundTask(.appRefresh("ca.sekei.StageGuide.liveActivityRefresh")) {
            let contentViewModel = await ContentViewModel()
            await contentViewModel.startNextAct()
        }
    }
}
