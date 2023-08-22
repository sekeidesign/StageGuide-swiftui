//
//  StageGuideApp.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    
    let persistenceController = PersistenceController.shared
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        print("Has launched before: \(UserDefaults.standard.bool(forKey: "HasLaunchedBefore"))")
        
        UserDefaults.standard.set(false, forKey: "HasLaunchedBefore")
        
        if !UserDefaults.standard.bool(forKey: "HasLaunchedBefore") {
            // Populate Core Data with initial data
            populateInitialData()
            UserDefaults.standard.set("Friday", forKey: "ActiveDay")
            UserDefaults.standard.set(true, forKey: "HasLaunchedBefore")
        }
        
        return true
    }
}

@main
struct StageGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
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
    }
}
