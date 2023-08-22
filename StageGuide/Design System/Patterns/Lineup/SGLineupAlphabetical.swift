//
//  SGLineupAlphabetical.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-14.
//

import SwiftUI

struct SGLineupAlphabetical: View {
    @State var isFavorite = false
    var day: Day?
    
    var body: some View {
        let lineupDay = day?.acts?.compactMap { $0 as? Act }
        let initialSlots = extractInitials(lineup: lineupDay ?? [])
        let placeholderName = "Unknown"
        ScrollView {
            VStack {
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
                                SGActSchedule(viewModel: actViewModel)
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
}

#Preview {
    SGLineupAlphabetical()
}
