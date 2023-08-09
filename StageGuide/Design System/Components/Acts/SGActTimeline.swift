//
//  SGActTimeline.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-07.
//

import SwiftUI

struct SGActTimeline: View {
    var actName: String = "Seven Lions"
    var startTime: Date = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 0)
    var endTime: Date = dateFrom(year: 2023, month: 9, day: 8, hour: 18, minute: 45)
    @Binding var isFavorite: Bool
    let hourScale: CGFloat = 240
    
    var body: some View {
        let duration = getDuration(date1: startTime, date2: endTime)
        
        HStack(spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(actName)
                        .font(.callout)
                        .bold()
                Text("10:30pm-11:30pm")
                    .font(.caption)
                    .foregroundColor(Color(UIColor.secondaryLabel))
            }
            .padding(.leading, 8)
            .padding(.trailing, 4)
            .frame(maxWidth: .infinity, alignment: .leading)
            SGAddButton(isActive: $isFavorite, variant: .edge){
                isFavorite.toggle()
            }
        }
        .frame(width: duration / 60 * hourScale, height: 56)
        .background(isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
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

struct SGActTimeline_Previews: PreviewProvider {
    static var previews: some View {
        @State var isFavorite = true
        SGActTimeline(isFavorite: $isFavorite)
    }
}
