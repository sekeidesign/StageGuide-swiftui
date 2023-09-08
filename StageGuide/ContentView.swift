//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI
import ActivityKit
import BackgroundTasks
//import UserNotifications

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel
    @State private var activeTab = 2
    
    var body: some View {
//        if !viewModel.areNotificationsEnabled {
//            Button("Request notifications") {
//                viewModel.requestNotificationPermission()
//            }
//            .buttonStyle(.bordered)
//            Button("Print token") {
//                print(viewModel.areNotificationsEnabled as Any)
//            }
//            .buttonStyle(.bordered)
//        } else {
            NavigationStack{
                TabView(selection: $activeTab) {
                    EventInfoView()
                        .tabItem {
                            Label("Event info", systemImage: "music.note.house")
                        }
                        .tag(1)
                    FullScheduleView(days: viewModel.days ?? [])
                        .tabItem {
                            Label("Full schedule", systemImage: "sparkles.rectangle.stack")
                        }
                        .tag(2)
//                    YourScheduleView(days: viewModel.days ?? [])
//                        .tabItem {
//                            Label("Your schedule", systemImage: "calendar")
//                        }
//                        .tag(3)
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
                viewModel.loadData()
                viewModel.initLiveActivity()
//            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}
