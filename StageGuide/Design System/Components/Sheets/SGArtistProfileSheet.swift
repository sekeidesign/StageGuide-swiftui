//
//  SGArtistProfileSheet.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-19.
//

import SwiftUI

struct SGArtistProfileSheet: View {
    @Environment(\.dismiss) var dismiss
    var act: Act
    let imageHeight: CGFloat = 264
    
    var body: some View {
        
        // Header stack
        VStack(spacing: 16) {
            // Header image + name
            ZStack(alignment: .bottomLeading) {
                Image(act.imageName ?? "Act")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: imageHeight)
                Rectangle()
                    .fill(LinearGradient(
                        stops: [
                            Gradient.Stop(color: Color(uiColor: .systemBackground), location: 0.2),
                            Gradient.Stop(color: Color(uiColor: .systemBackground).opacity(0), location: 1.00),
                        ],
                        startPoint: UnitPoint(x: 0.45, y: 1.1),
                        endPoint: UnitPoint(x: 0.55, y: 0)))
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
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
                .padding(16)
            }
            .frame(height: imageHeight)
            .clipped()
            VStack (spacing: 16) {
                // Metadata
                HStack{
                    VStack(spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Text(act.stage?.name ?? "Unknown stage")
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
                SGReadMore(originalText: act.bio ?? "", maxLines: 3)
            }
            .frame(maxWidth: .infinity)
            .padding(16)
            Spacer()
        }
    }
}

//#Preview {
//    SGArtistProfileSheet()
//}
