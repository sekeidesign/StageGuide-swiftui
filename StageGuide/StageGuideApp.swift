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
    let viewModel = ContentViewModel()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Has launched before: \(UserDefaults.standard.bool(forKey: "HasLaunchedBefore"))")
        
        //        UserDefaults.standard.set(false, forKey: "HasLaunchedBefore")
        UIApplication.shared.registerForRemoteNotifications()
        
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
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken
                     deviceToken: Data) {
        guard deviceToken != viewModel.deviceToken else {
            print("Didn't update token")
            return
        }
        viewModel.setDeviceToken(deviceToken)
        //       self.sendDeviceTokenToServer(data: deviceToken)
    }
    
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError
                     error: Error) {
        print("Error: \(error)")
        // Try again later.
    }
}

@main
struct StageGuideApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) var scenePhase
    
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: appDelegate.viewModel)
                .preferredColorScheme(.dark)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear {
                    UNUserNotificationCenter.current().getNotificationSettings { settings in
                        switch settings.authorizationStatus {
                        case .authorized:
                            // Notifications are enabled for your app
                            print("Notifications are enabled.")
                            appDelegate.viewModel.areNotificationsEnabled = true
                        case .denied:
                            // Notifications are explicitly disabled for your app
                            print("Notifications are denied.")
                            appDelegate.viewModel.areNotificationsEnabled = false
                        case .notDetermined:
                            // User hasn't been asked for notification permissions yet
                            print("Notifications not determined.")
                            appDelegate.viewModel.areNotificationsEnabled = false
                        case .provisional:
                            // Notifications are provisionally authorized (iOS 12+)
                            print("Notifications are provisionally authorized.")
                        case .ephemeral:
                            print("Notifications are ephemeral.")
                        @unknown default:
                            // Handle any future authorization status
                            break
                        }
                    }
                }
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
    }
}
