//
//  SGArtistProfileSheet.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-19.
//

import SwiftUI

struct SGActDetailSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: ActViewModel
    var act: Act
    let imageHeight: CGFloat = 280
    
    var body: some View {
        let act = viewModel.act
        // Header stack
        VStack(spacing: 16) {
            // Header image + name
            GeometryReader { geometry in
                ZStack(alignment: .bottomLeading) {
                    Image(act.imageName ?? "Act")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .frame(maxHeight: imageHeight + 72)
                    Rectangle()
                        .fill(LinearGradient(
                            stops: [
                                Gradient.Stop(color: Color(uiColor: .systemBackground), location: 0.05),
                                Gradient.Stop(color: Color(uiColor: .systemBackground).opacity(0), location: 0.6),
                            ],
                            startPoint: UnitPoint(x: 0.5, y: 1),
                            endPoint: UnitPoint(x: 0.5, y: 0)))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    VStack (alignment: .trailing) {
                        SGCircleButton(symbol: Image(systemName: "xmark"), variant: .secondary, onMaterial: true){
                            dismiss()
                        }
                        Spacer()
                        HStack(spacing: 8) {
                            Text(act.name ?? "Unknown")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(Color(uiColor: .label))
                                .multilineTextAlignment(.leading)
                            Spacer()
                            SGAddButton(isActive: act.isFavorite, action: viewModel.toggleFavoriteStatus)
                        }
                        .frame(alignment: .leading)
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 20)
                }
                .frame(height: imageHeight + 72)
                .clipped()
                //                .frame(width: geometry.size.width)
            }
            ScrollView {
                VStack (spacing: 24) {
                    // Metadata
                    HStack{
                        VStack(spacing: 4) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text(act.stage?.name ?? "Unknown stage")
                                .multilineTextAlignment(.center)
                        }
                        .frame(maxWidth: .infinity)
                        Rectangle()
                            .fill(Color(uiColor: .separator))
                            .frame(width: 1, height: 32)
                        VStack(spacing: 4) {
                            Image(systemName: "clock")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text(formatTime(date: act.startTime ?? Date(), timeZone: "America/Montreal"))
                        }
                        .frame(maxWidth: .infinity)
                        Rectangle()
                            .fill(Color(uiColor: .separator))
                            .frame(width: 1, height: 32)
                        VStack(spacing: 4) {
                            Image(systemName: "calendar")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text(act.day?.name ?? "Unknown day")
                        }
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.bottom, 8)
                    SGReadMore(originalText: act.bio ?? "", maxLines: 4)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Links")
                            .font(.title3)
                            .fontWeight(.semibold)
                        SGLinkList(links: act.links ?? [])
                    }
                    .isHidden(act.links?.count ?? 0 < 1, remove: true)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
            }
        }
    }
}

//#Preview {
//    SGActDetailSheet()
//}
