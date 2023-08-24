//
//  SGLineupSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import SwiftUI

struct SGLineupSchedule: View {
    var day: Day?
    
    var body: some View {
        let rawLineupDay = day?.acts?.compactMap { $0 as? Act }
        let lineupDay = rawLineupDay?.filter({$0.name != "Intermission"})
        let timeSlots = extractTimeSlots(lineup: lineupDay ?? [])
        ScrollView {
            VStack (spacing: 8) {
                ForEach(timeSlots, id: \.self) { timeSlot in
                    let actsInSlot: [Act] = lineupDay?.filter {
                        formatToTimeSlot(inputTime: $0.startTime ?? Date()) == timeSlot
                    } ?? []
                    HStack (alignment: .top){
                        Text("\(timeSlot)")
                            .font(.footnote)
                            .foregroundStyle(Color(uiColor: .secondaryLabel))
                            .padding(.top, 4)
                            .frame(width: 40, alignment: .leading)
                        VStack {
                            ForEach(actsInSlot.sorted(by: { $0.startTime ?? Date() < $1.startTime ?? Date() }), id: \.self.id) { act in
                                let actViewModel = ActViewModel(act: act){
                                }
                                SGActSchedule(viewModel: actViewModel)
                            }
                        }
                    }
                    .padding(.trailing, 4)
                    .padding(.top, 8)
                    .overlay(
                        Rectangle()
                            .frame(height: 1)
                            .foregroundColor(Color(uiColor: .separator).opacity(0.7))
                        , alignment: .top
                    )
                }
            }
            .padding(.leading, 16)
        }
    }
}

//#Preview {
//    SGLineupSchedule()
//}
