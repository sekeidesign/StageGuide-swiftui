//
//  SGLineupAlphabetical.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-14.
//

import SwiftUI

struct SGLineupAlphabetical: View {
    var day: Day?
    var inContext: scheduleViewContext = .fullSchedule
    
    var body: some View {
        let rawLineupDay = day?.acts?.compactMap { $0 as? Act }
        let lineupDay = rawLineupDay?.filter({$0.name != "Break"})
        let lineupDayFavorites = rawLineupDay?.filter({$0.name != "Break"}).filter({$0.isFavorite == true})
        let initialSlots = extractInitials(lineup: inContext == .yourSchedule ? lineupDayFavorites! : lineupDay ?? [])
        let placeholderName = "Unknown"
        ScrollView {
            VStack (spacing: 8) {
                ForEach(initialSlots, id: \.self) { initial in
                    let actsInSlot: [Act] = lineupDay?.filter {
                        let actName = $0.name
                        let currentInitial = actName?[actName?.startIndex ?? placeholderName.startIndex] ?? "U"
                        return "\(currentInitial)" == initial
                    } ?? []
                    HStack (alignment: .top){
                        Text("\(initial)")
                            .font(.footnote)
                            .foregroundStyle(Color(uiColor: .secondaryLabel))
                            .padding(.top, 4)
                            .frame(width: 40, alignment: .leading)
                        VStack {
                            ForEach(actsInSlot, id: \.self.id) { act in
                                let actViewModel = ActViewModel(act: act){
                                    // toggle
                                }
                                if inContext == .fullSchedule {
                                    SGActSchedule(viewModel: actViewModel, hasAdd: true)
                                } else {
                                    SGActSchedule(viewModel: actViewModel, hasAdd: false)
                                        .isHidden(act.isFavorite == false, remove: true)
                                }
                            }
                        }
                        .padding(.trailing, 8)
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
            VStack {}
                .frame(height: 8)
        }
    }
}

//#Preview {
//    SGLineupAlphabetical()
//}
