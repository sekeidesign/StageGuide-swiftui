//
//  SGLineupSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-10.
//

import SwiftUI

struct SGLineupSchedule: View {
    @State var isFavorite = false
    let lineupDay = friday
    //    ForEach(hourSlots){ slot in
    //      actsInSlot: [Act] = filter friday to get acts with matching startTime
    //      ForEach(actsInSlot){ act in
    //        SGActSchedule
    //      }
    //    }
    
    var body: some View {
        let timeSlots = extractTimeSlots(lineup: lineupDay)
        VStack {
            ForEach(timeSlots, id: \.self) { timeSlot in
                let actsInSlot: [Act] = lineupDay.filter {
                    $0.startTime == timeSlot
                }
                HStack (alignment: .top){
                    Text("\(formatToTimeSlot(inputTime: timeSlot))")
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
                        .foregroundColor(Color(uiColor: .separator))
                    , alignment: .top
                )
            }
        }
        .padding(.leading, 16)
    }
    init() {
        print(extractTimeSlots(lineup: friday))
    }
}

// Extract all the available time slots
func extractTimeSlots(lineup: [Act]) -> [Date] {
    var timeSlots: [Date] = []
    lineup.forEach { act in
        guard !timeSlots.contains(act.startTime) else {
            return
        }
        timeSlots.append(act.startTime)
    }
    return timeSlots.sorted()
}

#Preview {
    SGLineupSchedule()
}
