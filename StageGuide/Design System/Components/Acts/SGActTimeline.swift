//
//  SGActTimeline.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-07.
//

import SwiftUI

struct SGActTimeline: View {
    var act: Act
    @State private var isSheetPresented = false
    
    @Binding var isFavorite: Bool
    let hourScale: CGFloat = 240
    
    var body: some View {
        let duration = getDuration(date1: act.startTime ?? Date(), date2: act.endTime ?? Date())
        
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(act.name ?? "Unknown name")
                        .font(.callout)
                        .bold()
                Text("\(formatTimeRange(startTime: act.startTime ?? Date(), endTime: act.endTime ?? Date(), timeZone: "America/New_York"))")
                    .font(.caption)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .padding(.leading, 8)
            .padding(.trailing, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            SGAddButton(isActive: false, variant: .edge){
                isFavorite.toggle()
            }
        }
        .frame(width: duration / 60 * hourScale, height: 56)
        .background(isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        .onTapGesture {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented){
            SGArtistProfileSheet(act: act)
        }
    }
}

func getDuration(date1: Date, date2: Date) -> CGFloat {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: date1, to: date2)
        
        if let minutes = components.minute {
            return CGFloat(abs(minutes))
        }
        
        return 0
    }

//struct SGActTimeline_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var isFavorite = true
//        SGActTimeline(isFavorite: $isFavorite)
//    }
//}
