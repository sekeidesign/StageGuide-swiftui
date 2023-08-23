//
//  EventScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-22.
//

import SwiftUI

struct EventScheduleView: View {
    let persistenceController = PersistenceController.shared
    let days: FetchedResults<Day>
    @State var activeDay: Day
    
    var body: some View {
        var activeDayObject: Day? {
            days.first(where: { $0.name == activeDay.name })
        }
        let activeDayActs = activeDayObject?.acts?.compactMap { $0 as? Act }
        let activeDayFeatured = activeDayActs?.filter() { act in
            return act.isFeatured
        }
        NavigationStack {
            VStack {
                Picker("Day", selection: $activeDay) {
                    ForEach(days.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date() }), id: \.self) { day in
                        Text(day.name ?? "Unknown").tag(days.filter({ filteredDay in
                            day.name == filteredDay.name
                        }))
                    }
                }
                .onChange(of: activeDay) { day in
                    UserDefaults.standard.set(day.name ?? "", forKey: "ActiveDay")
                    print("Set: \(day.name ?? "")")
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                .padding(.vertical, 8)
                HStack {
                    Text("Featured artists")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        persistenceController.deleteAllData()
                    } label: {
                        Text("Reset data")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical, 8)
                SGFeaturedActs(featuredActs: activeDayFeatured ?? [])
                    .padding(.bottom, 12)
                HStack {
                    Text("Full schedule")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.vertical, 8)
                SGLineupAlphabetical(day: activeDayObject)
            }
            .navigationTitle(Text("Riverside Festival"))
            .navigationBarHidden(true)
        }
    }
}

//#Preview {
//    EventScheduleView()
//}
