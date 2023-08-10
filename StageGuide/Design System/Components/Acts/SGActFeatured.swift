//
//  SGActFeatured.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct SGActFeatured: View {
    var act: Act = placeholderAct()
    var stageColor: Color = Color(uiColor: .systemYellow)
    var showStageColor: Bool = false
    @Binding var isFavorite: Bool
    
    @State var canTouchDown = true
    @State var isPressed = false
    
    var body: some View {
        
        VStack(spacing: 0) {
            act.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 88)
                .clipped()
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
                        .frame(height: 20)
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
            .padding(12)
            .padding(.trailing, 4)
        }
        .frame(width: 232)
        .background(isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
//        .scaleEffect(isPressed ? 0.9 : 1)
//        .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 7), value: isPressed)
//        .gesture(DragGesture(minimumDistance: 0.0)
//            .onChanged{ _ in
//                if canTouchDown {
//                    isPressed = true
//                }
//                canTouchDown = false
//            } .onEnded { _ in
//                isPressed = false
//                canTouchDown = true
//            }
//        )
    }
}

struct SGActFeatured_Previews: PreviewProvider {
    static var previews: some View {
        @State var isActive = false
        SGActFeatured(isFavorite: $isActive)
    }
}
