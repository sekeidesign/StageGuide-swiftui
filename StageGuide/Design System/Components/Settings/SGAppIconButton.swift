//
//  SGAppIconButton.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-07.
//

import SwiftUI

struct SGAppIconButton: View {
    var image: Image = Image("Custom Icons/Riverside")
    var label: Text = Text("Riverside")
    var isActive: Bool = true
    
    var body: some View {
        VStack(spacing: 5) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .if(isActive, transform: { view in
                    view.overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 14, style: .continuous)
                            .stroke(Color.accentColor, lineWidth: 2)
                    )}
                )
                    label
                    .font(.caption)
                    .foregroundColor(isActive ? Color(uiColor: .label) : Color(uiColor: .secondaryLabel))
        }
    }
}

struct SGAppIconButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack (spacing: 16) {
            SGAppIconButton()
            SGAppIconButton(image: Image("Custom Icons/OG"), label: Text("OG"), isActive: false)
        }
    }
}
