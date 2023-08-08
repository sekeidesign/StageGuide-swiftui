//
//  SGActFeatured.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-08.
//

import SwiftUI

struct SGActFeatured: View {
    @Binding var isActive: Bool
    var actName: String = "Gigantic NGHTMRE"
    var actImage: Image = Image("Artist Placeholder")
    var duration: CGFloat = 60
    var hourScale: CGFloat = 240
    var stageName: String = "Main"
    var stageColor: Color = Color(uiColor: .systemYellow)
    var showStageColor: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            actImage
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
                    Text(actName)
                        .font(.callout)
                        .bold()
                        .frame(height: 20)
                    HStack (spacing: 4) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 10))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Text("\(stageName) Stage")
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                    HStack (spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 10))
                            .foregroundColor(Color(uiColor: .secondaryLabel))
                        Text("10:30pm-11:30pm")
                            .font(.footnote)
                            .foregroundColor(Color(UIColor.secondaryLabel))
                    }
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                SGAddButton(isActive: $isActive){
                    isActive.toggle()
                }
            }
            .padding(12)
            .padding(.trailing, 4)
        }
        .frame(width: 232)
        .background(isActive ? Color(UIColor.secondarySystemFill) : Color(UIColor.tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

struct SGActFeatured_Previews: PreviewProvider {
    static var previews: some View {
        @State var isActive = false
        SGActFeatured(isActive: $isActive)
    }
}
