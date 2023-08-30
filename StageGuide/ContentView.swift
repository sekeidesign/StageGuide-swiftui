//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<Day>
    
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
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}
