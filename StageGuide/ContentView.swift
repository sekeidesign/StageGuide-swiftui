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
                FullScheduleView(days: days)
                    .tabItem {
                        Label("Full schedule", systemImage: "sparkles.rectangle.stack")
                    }
                YourScheduleView(days: days)
                    .tabItem {
                        Label("Your schedule", systemImage: "calendar")
                    }
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
