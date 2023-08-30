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
                    EventLinks()
                    EventDescription()
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
    @GestureState private var zoom = 1.0
    
    var body: some View {
        VStack (spacing: 8) {
            Text("Map")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Image("Riverside Map")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .scaleEffect(zoom)
                .gesture(
                    MagnificationGesture()
                        .updating($zoom) { value, gestureState, transaction in
                            gestureState = value.magnitude
                        }
                )
                .animation(.easeInOut, value: zoom)
        }
    }
}

struct EventLinks: View {
    let riversideLinks = [
        "https://www.instagram.com/festivalriverside/",
         "https://www.facebook.com/riversidefest",
        "https://billetterie.festivalriverside.ca/Online/default.asp"
    ]
    var body: some View {
        VStack (spacing: 8) {
            Text("Links")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            SGLinkList(links: riversideLinks)
        }
    }
}

struct EventDescription: View {
    let riversideDescription = "This year is the 10th anniversary of the festival and it’s going to be completely CRAZY! You don’t want to miss it. Founded in 2013, Riverside is the first festival entirely dedicated to electronic music in Gatineau"
    var body: some View {
        VStack (spacing: 8) {
            Text("Links")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            SGReadMore(originalText: riversideDescription, maxLines: 3)
        }
    }
}

//struct EventInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventInfoView()
//    }
//}
