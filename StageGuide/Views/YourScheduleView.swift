//
//  YourScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-25.
//

import SwiftUI

struct YourScheduleView: View {
    @State var days: FetchedResults<Day>
    @AppStorage("ActiveDay") private var activeDay: String = (UserDefaults.standard.string(forKey: "ActiveDay") ?? "Friday")
    @State private var activeScheduleView: String = "Schedule"
    
    var body: some View {
        let availableDays: [String] = days.sorted(by: {$0.startTime ?? Date() < $1.startTime ?? Date()}).compactMap({$0.name})
        let activeDayObject: Day = days.first(where: {$0.name == activeDay})!
        VStack {
            SGTopNav()
            Picker("Day", selection: $activeDay) {
                ForEach(availableDays, id: \.self) { day in
                    Text(day).tag(availableDays.filter({ filteredDay in
                        filteredDay == day
                    }))
                }
            }
            .onChange(of: activeDay) { day in
                UserDefaults.standard.set(day, forKey: "ActiveDay")
                print("Set: \(day)")
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
            case "Schedule": SGLineupSchedule(day: activeDayObject, inContext: .yourSchedule)
            case "Alphabetical": SGLineupAlphabetical(day: activeDayObject, inContext: .yourSchedule)
            default: Text("Something went wrong")
            }
        }
    }
}

//#Preview {
//    YourScheduleView()
//}
