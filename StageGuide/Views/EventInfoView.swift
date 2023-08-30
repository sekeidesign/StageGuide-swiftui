//
//  EventInfoView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-29.
//

import SwiftUI

struct EventInfoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                SGTopNav()
                EventInfoHeader()
                VStack(spacing: 16) {
                    EventInfoMap()
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct EventInfoHeader: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Image("Acts/Act Placeholder")
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .frame(maxWidth: .infinity)
            Rectangle()
                .fill(LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(uiColor: .systemBackground), location: 0.05),
                        Gradient.Stop(color: Color(uiColor: .systemBackground).opacity(0), location: 0.6),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: 1),
                    endPoint: UnitPoint(x: 0.5, y: 0)))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            HStack {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starts")
                            .foregroundColor(Color(uiColor: .tertiaryLabel))
                            .textCase(.uppercase)
                            .font(.caption2)
                            .bold()
                        HStack (spacing: 2) {
                            Text("Sept 8")
                            Text("at")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text("3:00pm")
                        }
                    }
                    Spacer()
                    Image(systemName: "arrow.right")
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    Spacer()
                    VStack(alignment: .trailing, spacing: 4) {
                        Text("Ends")
                            .foregroundColor(Color(uiColor: .tertiaryLabel))
                            .textCase(.uppercase)
                            .font(.caption2)
                            .bold()
                        HStack (spacing: 2) {
                            Text("Sept 10")
                            Text("at")
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            Text("11:00pm")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .padding(.bottom, 16)
        .frame(height: 120)
        .clipped()
    }
}

struct EventInfoMap: View {
    var body: some View {
        VStack (spacing: 8) {
            Text("Map")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            GeometryReader { geometry in
                Image("Riverside Map")
                    .frame(width: geometry.size.width)
                    .clipped()
            }
        }
    }
}

//struct EventInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventInfoView()
//    }
//}
