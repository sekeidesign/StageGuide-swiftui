//
//  SGLineupSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import SwiftUI

struct SGLineupSchedule: View {
    @State var isFavorite = false
    let lineupDay = friday.sorted { $0.startTime < $1.startTime }
    
    var body: some View {
        let timeSlots = extractTimeSlots(lineup: lineupDay)
        VStack {
            ForEach(timeSlots, id: \.self) { timeSlot in
                let actsInSlot: [Act] = lineupDay.filter {
                    formatToTimeSlot(inputTime: $0.startTime) == timeSlot
                }
                HStack (alignment: .top){
                    Text("\(timeSlot)")
                        .font(.footnote)
                        .foregroundStyle(Color(uiColor: .secondaryLabel))
                        .padding(.top, 4)
                        .frame(width: 40, alignment: .leading)
                    VStack {
                        ForEach(actsInSlot, id: \.self.id) { act in
                            SGActSchedule(act: act, isFavorite: $isFavorite)
                        }
                    }
                    .padding(.trailing, 4)
                }
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

#Preview {
    SGLineupSchedule()
}
