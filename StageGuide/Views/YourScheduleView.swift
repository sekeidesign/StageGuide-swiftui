//
//  YourScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-25.
//

import SwiftUI

struct YourScheduleView: View {
    @State var days: FetchedResults<Day>
    @State var activeDay: Day
    @State private var activeScheduleView: String = "Schedule"
    
    var body: some View {
        var activeDayObject: Day? {
            days.first(where: { $0.name == activeDay.name })
        }
        let activeDayActs = activeDayObject?.acts?.compactMap { $0 as? Act }
        VStack {
            SGTopNav()
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
            .padding(.bottom, 8)
            HStack {
                Text("Full schedule")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                Picker("Schedule view", selection: $activeScheduleView) {
                    ForEach(["Schedule", "Alphabetical"], id: \.self) {
                        Text($0)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 8)
            switch(activeScheduleView) {
            case "Schedule": SGLineupSchedule(day: activeDayObject)
            case "Alphabetical": SGLineupAlphabetical(day: activeDayObject)
            default: Text("Something went wrong")
            }
        }
    }
}

//#Preview {
//    YourScheduleView()
//}
