//
//  YourScheduleView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-25.
//

import SwiftUI

struct YourScheduleView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var days: [Day]
    @AppStorage("ActiveDay") private var activeDay: String = (UserDefaults.standard.string(forKey: "ActiveDay") ?? "Friday")
    @State private var activeScheduleView: String = "Schedule"
    
    var body: some View {
        let availableDays: [String] = days.sorted(by: {$0.startTime ?? Date() < $1.startTime ?? Date()}).compactMap({$0.name})
        let activeDayObject: Day = days.first(where: {$0.name == activeDay})!
        VStack {
            SGTopNav()
            UpNextForYou(days: days, isFestivalLive: viewModel.isFestivalLive)
                .padding(.horizontal)
                .padding(.bottom, 16)
            Picker("Day", selection: $activeDay) {
                ForEach(availableDays, id: \.self) { day in
                    Text(day).tag(availableDays.filter({ filteredDay in
                        filteredDay == day
                    }))
                }
            }
            .onChange(of: activeDay) { day in
                UserDefaults.standard.set(day, forKey: "ActiveDay")
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            .padding(.bottom, 8)
            HStack {
                Text("Your schedule")
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
            .onAppear {
                viewModel.hasFestivalStarted()
            }
            switch(activeScheduleView) {
            case "Schedule": SGLineupSchedule(day: activeDayObject, inContext: .yourSchedule)
            case "Alphabetical": SGLineupAlphabetical(day: activeDayObject, inContext: .yourSchedule)
            default: Text("Something went wrong")
            }
        }
    }
}

struct UpNextForYou: View {
    let days: [Day]
    let isFestivalLive: Bool
    var body: some View {
        let today = days.first(where: {Date() < $0.endTime ?? Date()})
        let rawLineupDay = today?.acts?.compactMap { $0 as? Act }
        let sortedLineup = rawLineupDay?.sorted(by: {$0.startTime ?? Date() < $1.startTime ?? Date()})
        guard let nextAct = (sortedLineup?.first(where: {$0.startTime ?? Date() > Date() && $0.isFavorite == true})) else { return AnyView(Rectangle().isHidden(true, remove: true)) }
        let actViewModel = ActViewModel(act: nextAct){}
        return AnyView(VStack(alignment: .leading, spacing: 8) {
            Text("Up next for you")
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            SGActSchedule(viewModel: actViewModel, hasAdd: false)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color(uiColor: .tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
        .isHidden(isFestivalLive, remove: true)
        )
    }
}

//#Preview {
//    YourScheduleView()
//}
