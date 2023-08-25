//
//  SGActSchedule.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct SGActSchedule: View {
    @ObservedObject var viewModel: ActViewModel
    var hasAdd = true
    
    @State private var isSheetPresented = false
    
    var body: some View {
        let act = viewModel.act
        HStack(spacing: 12) {
//            HStack {}
//                .frame(width: 2, height: 52)
//                .background(stageColor)
//                .cornerRadius(99)
//                .isHidden(!showStageColor, remove: true)
            VStack(alignment: .leading, spacing: 2) {
                Text(act.name ?? "Uknown name")
                        .font(.callout)
                        .bold()
                HStack (spacing: 4) {
                    Image(systemName: "mappin.and.ellipse")
                        .font(.system(size: 10))
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Text("\(act.stage?.name ?? "Unknown stage") Stage")
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
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
            SGAddButton(isActive: act.isFavorite, action: viewModel.toggleFavoriteStatus)
                .isHidden(!hasAdd, remove: true)
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .padding(.trailing, 4)
        .background(act.isFavorite ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .onTapGesture {
            isSheetPresented = true
        }
        .sheet(isPresented: $isSheetPresented){
            SGActDetailSheet(viewModel: viewModel, act: act)
        }
    }
}

//struct SGActSchedule_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var isActive = false
//        SGActSchedule(isFavorite: $isActive)
//    }
//}
