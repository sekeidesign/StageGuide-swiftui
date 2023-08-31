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
            Image("Cover Image")
                .resizable()
                .scaledToFill()
                .frame(height: 200)
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
            VStack(spacing: 16) {
                Image("Riverside Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 104, height: 104)
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
            }
        }
        .padding(.bottom, 8)
        .frame(height: 200)
        .clipped()
    }
}

struct EventInfoMap: View {
    @State private var isPickerPresented = false
    let latitude = 45.429128
    let longitude = -75.709037
    
    var body: some View {
        HStack {
            HStack(spacing: 12) {
                Image("Map")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                Text("Canadian Museum of History \n100 Laurier St, Gatineau, QC ")
                    .foregroundColor(Color(uiColor: .secondaryLabel))
                    .font(.subheadline)
                Spacer()
            }
            .padding(.trailing, 16)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .secondarySystemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .onTapGesture {
                isPickerPresented = true
            }
            .alert("View in Maps", isPresented: $isPickerPresented) {
                if(UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!)){
                    Button("Google Maps"){
                        let url = URL(string: "comgooglemaps://?saddr=&daddr=\(latitude),\(longitude)")
                        if UIApplication.shared.canOpenURL(url!) {
                            UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                        }
                    }
                }
                Button("Apple Maps"){
                    let url = URL(string: "maps://?saddr=&daddr=\(latitude),\(longitude)")
                    if UIApplication.shared.canOpenURL(url!) {
                          UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                    }
                }
                Button("Cancel", role: .cancel) { }
            }
        }
        .frame(height: 64)
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
    let riversideDescription = "This year is the 10th anniversary of the festival and it’s going to be completely CRAZY! You don’t want to miss it. \nFounded in 2013, Riverside is the first festival entirely dedicated to electronic music in Gatineau."
    var body: some View {
        VStack (spacing: 8) {
            Text("Description")
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(riversideDescription)
                .foregroundColor(Color(uiColor: .secondaryLabel))
                .frame(maxWidth: .infinity)
        }
    }
}

//struct EventInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        EventInfoView()
//    }
//}
