//
//  SGLineupAlphabetical.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-14.
//

import SwiftUI

struct SGLineupAlphabetical: View {
    @State var isFavorite = false
    let lineupDay = friday.sorted { $0.name < $1.name }
    
    var body: some View {
        let initialSlots = extractInitials(lineup: lineupDay)
        VStack {
            ForEach(initialSlots, id: \.self) { initial in
                let actsInSlot: [Act] = lineupDay.filter {
                    let actName = $0.name
                    return "\(actName[actName.startIndex])" == initial
                }
                HStack (alignment: .top){
                    Text("\(initial)")
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
    init() {
    }
}

#Preview {
    SGLineupAlphabetical()
}
