//
//  StageGuideApp.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UILabel.appearance().substituteFontName = "Satoshi";
        UITextView.appearance().substituteFontName =  "Satoshi";
        UITextField.appearance().substituteFontName = "Satoshi";
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
