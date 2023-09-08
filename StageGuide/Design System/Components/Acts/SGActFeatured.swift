//
//  SGActFeatured.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct SGActFeatured: View {
    @ObservedObject var viewModel: ActViewModel
    @State private var isSheetPresented = false
    
    @State var canTouchDown = true
    @State var isPressed = false
    
    var body: some View {
        let act = viewModel.act
        VStack(spacing: 0) {
            Image(act.imageName ?? "Artist Placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 88)
                .clipped()
            HStack(spacing: 12) {
//                HStack {}
//                    .frame(width: 2, height: 52)
//                    .background(stageColor)
//                    .cornerRadius(99)
//                    .isHidden(!showStageColor, remove: true)
                VStack(alignment: .leading, spacing: 2) {
                    Text(act.name ?? "Unknown name")
                        .font(.callout)
                        .bold()
                        .frame(height: 20)
//                    HStack (spacing: 4) {
//                        Image(systemName: "mappin.and.ellipse")
//                            .font(.system(size: 10))
//                            .foregroundColor(Color(uiColor: .secondaryLabel))
//                        Text("\(act.stage?.name ?? "Unknown") Stage")
//                            .font(.footnote)
//                            .foregroundColor(Color(UIColor.secondaryLabel))
//                    }
                    HStack (spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 10))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Text("\(formatTimeRange(startTime: act.startTime ?? Date(), endTime: act.endTime ?? Date(), timeZone: "America/New_York"))")
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
//                SGAddButton(isActive: act.isFavorite, action: viewModel.toggleFavoriteStatus)
            }
            .padding(12)
            .padding(.trailing, 4)
        }
        .frame(width: 232)
        .background(act.isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .onTapGesture {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented){
            SGActDetailSheet(viewModel: viewModel, act: act)
        }
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

//struct SGActFeatured_Previews: PreviewProvider {
//    static var previews: some View {
//        SGActFeatured(isFavorite: false)
//    }
//}
