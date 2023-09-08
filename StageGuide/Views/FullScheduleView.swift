//
//  FullScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-22.
//

import SwiftUI
import CoreData

struct FullScheduleView: View {
    @State var days: [Day]
    @AppStorage("ActiveDay") private var activeDay: String = (UserDefaults.standard.string(forKey: "ActiveDay") ?? "Friday")
    @State private var activeScheduleView: String = "Schedule"
    @State private var areFeaturedActsExpanded = true
    
    var body: some View {
        let availableDays: [String] = days.sorted(by: {$0.startTime ?? Date() < $1.startTime ?? Date()}).compactMap({$0.name})
        let activeDayObject: Day = days.first(where: {$0.name == activeDay})!
        let activeDayActs = activeDayObject.acts?.compactMap { $0 as? Act }
        let activeDayFeatured = activeDayActs?.filter() { act in
            return act.isFeatured
        }
        VStack {
            SGTopNav()
            Picker("Day", selection: $activeDay) {
                ForEach(availableDays, id: \.self) { day in
                    Text(day).tag(days.filter({ filteredDay in
                        day == filteredDay.name
                    }))
                }
            }
            .onChange(of: activeDay) { day in
                UserDefaults.standard.set(day , forKey: "ActiveDay")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom, 8)
            HStack {
                Text("Featured artists")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(areFeaturedActsExpanded ? Color(uiColor: .label) : Color(uiColor: .secondaryLabel))
                Spacer()
                Button {
                    withAnimation(Animation.easeInOut(duration: 0.2)) {
                        areFeaturedActsExpanded.toggle()
                    }
                } label: {
                    Text(areFeaturedActsExpanded ? "Hide" : "Show")
                    Image(systemName: "chevron.up")
                        .rotationEffect(.degrees(areFeaturedActsExpanded ? 0 : -180))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            .padding(.vertical, 8)
            SGFeaturedActs(featuredActs: activeDayFeatured ?? [])
                .padding(.bottom, 8)
                .isHidden(!areFeaturedActsExpanded, remove: true)
                .transition(.opacity)
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
                .offset(x: 12)
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
//    FullScheduleView()
//}
