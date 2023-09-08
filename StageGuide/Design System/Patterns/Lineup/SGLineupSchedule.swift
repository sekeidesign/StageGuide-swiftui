//
//  SGLineupSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import SwiftUI

enum scheduleViewContext {
    case fullSchedule
    case yourSchedule
}

struct SGLineupSchedule: View {
    var day: Day?
    var inContext: scheduleViewContext = .fullSchedule
    
    var body: some View {
        let rawLineupDay = day?.acts?.compactMap { $0 as? Act }
        let lineupDay = rawLineupDay?.filter({$0.name != "Break"})
        let lineupDayFavorites = rawLineupDay?.filter({$0.name != "Break"}).filter({$0.isFavorite == true})
        let timeSlots = extractTimeSlots(lineup: inContext == .yourSchedule ? lineupDayFavorites! : lineupDay ?? [])
        ScrollView {
            VStack (spacing: 8) {
                ForEach(timeSlots, id: \.self) { timeSlot in
                    let actsInSlot: [Act] = lineupDay?.filter {
                        formatToTimeSlot(inputTime: $0.startTime ?? Date()) == timeSlot
                    } ?? []
                    HStack (alignment: .top){
//                        Text("\(timeSlot)")
//                            .font(.footnote)
//                            .foregroundStyle(Color(uiColor: .secondaryLabel))
//                            .padding(.top, 4)
//                            .frame(width: 40, alignment: .leading)
                        VStack {
                            ForEach(actsInSlot.sorted(by: { $0.startTime ?? Date() > $1.startTime ?? Date() }), id: \.self.id) { act in
                                let actViewModel = ActViewModel(act: act){
                                }
                                if inContext == .fullSchedule {
                                    SGActSchedule(viewModel: actViewModel, hasAdd: true)
                                } else {
                                    SGActSchedule(viewModel: actViewModel, hasAdd: false)
                                        .isHidden(act.isFavorite == false, remove: true)
                                }
                            }
                        }
                    }
                    .padding(.trailing, 8)
//                    .padding(.top, 8)
//                    .overlay(
//                        Rectangle()
//                            .frame(height: 1)
//                            .foregroundColor(Color(uiColor: .separator).opacity(0.7))
//                        , alignment: .top
//                    )
                }
            }
            .padding(.leading, 16)
            VStack {}
                .frame(height: 8)
        }
    }
}

//#Preview {
//    SGLineupSchedule()
//}
