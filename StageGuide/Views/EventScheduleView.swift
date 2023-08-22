//
//  EventScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-22.
//

import SwiftUI

struct EventScheduleView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(sortDescriptors: []) var days: FetchedResults<Day>
    let persistenceController = PersistenceController.shared
    
    var body: some View {
        var friday: Day? {
            days.first(where: { $0.name == "Friday" })
        }
        let fridayActs = friday?.acts?.compactMap { $0 as? Act }
        let fridayFeatured = fridayActs?.filter() { act in
            return act.isFeatured
        }
        NavigationStack {
            VStack {
                SGFeaturedActs(featuredActs: fridayFeatured ?? [])
                HStack {
                    Text("Full schedule")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                SGLineupAlphabetical(day: friday)
            }
            .navigationTitle(Text("Riverside Festival"))
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    EventScheduleView()
}
