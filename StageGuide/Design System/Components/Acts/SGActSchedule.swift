//
//  SGActSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct SGActSchedule: View {
    var act: Act = placeholderAct()
    var stageColor: Color = Color(uiColor: .systemYellow)
    var showStageColor: Bool = false
    @Binding var isFavorite: Bool
    
    var body: some View {
        HStack(spacing: 12) {
            HStack {}
                .frame(width: 2, height: 52)
                .background(stageColor)
                .cornerRadius(99)
                .isHidden(!showStageColor, remove: true)
            VStack(alignment: .leading, spacing: 2) {
                Text(act.name)
                        .font(.callout)
                        .bold()
                HStack (spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 10))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Text("\(act.stage) Stage")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                HStack (spacing: 4) {
                    Image(systemName: "clock")
                        .font(.system(size: 10))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Text("\(formatTimeRange(startTime: act.startTime, endTime: act.endTime, timeZone: "America/New_York"))")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            SGAddButton(isActive: $isFavorite){
                isFavorite.toggle()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .padding(.trailing, 4)
        .background(isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct SGActSchedule_Previews: PreviewProvider {
    static var previews: some View {
        @State var isActive = false
        SGActSchedule(isFavorite: $isActive)
    }
}
