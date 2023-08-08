//
//  SGActTimeline.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-07.
//

import SwiftUI

struct SGActTimeline: View {
    @Binding var isActive: Bool
    var actName: String = "Seven Lions"
    var duration: CGFloat = 60
    var hourScale: CGFloat = 240
    
    var body: some View {
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
            SGAddButton(isActive: $isActive, variant: .edge){
                isActive.toggle()
            }
        }
        .frame(width: duration / 60 * hourScale, height: 56)
        .background(isActive ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct SGActTimeline_Previews: PreviewProvider {
    static var previews: some View {
        @State var isActive = true
        SGActTimeline(isActive: $isActive)
    }
}
