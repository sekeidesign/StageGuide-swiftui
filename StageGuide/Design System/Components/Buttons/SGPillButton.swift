//
//  SGPillButton.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-03.
//

import SwiftUI

struct SGPillButton: View {
    
    var symbol: Image?
    var label: Text? = Text("Label")
    var isActive: Bool = false
    var onMaterial: Bool = false
    var action: () -> Void = placeholderAction
    
    var foregroundColor: Color {
            switch isActive {
            case true: return .black
            case false: return Color(uiColor: .secondaryLabel)
            }
        }
    var buttonTint: Color {
            switch isActive {
            case true: return .accentColor
            case false: return onMaterial ? Color(UIColor.tertiarySystemFill) : Color(UIColor.secondarySystemFill)
            }
        }
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 4){
                symbol
                    .font(.system(size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(foregroundColor)
                label
                    .foregroundColor(foregroundColor)
                    .font(.footnote)
                    .bold()
            }
            .frame(height: 34)
            .frame(minWidth: 28)
            .padding(.leading, symbol != nil ? 0 : 4)
            .padding(.trailing, label != nil ? 4 : 0)
        }
        .frame(height: 34)
        .frame(minWidth: 16)
        .buttonStyle(.borderedProminent)
        .tint(buttonTint)
        .cornerRadius(99999)
    }
}

struct SGPillButton_Previews: PreviewProvider {
    private var isPreviewDisabled = true
    static var previews: some View {
        VStack(spacing: 16) {
            SGPillButton(symbol: Image(systemName: "star.fill"), label: Text("Saved"), isActive: true)
            SGPillButton(symbol: Image(systemName: "person.fill.badge.plus"), label: nil, isActive: false, onMaterial: true)
            SGPillButton(symbol: Image(systemName: "square.and.arrow.up"), label: Text("Share"), isActive: false, onMaterial: false)
        }
    }
}
