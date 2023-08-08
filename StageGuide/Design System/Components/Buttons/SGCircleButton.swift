//
//  SGCircleButton.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-04.
//

import SwiftUI

struct SGCircleButton: View {
    
    enum CircleButtonVariants {
        case primary
        case secondary
    }
    
    var symbol: Image?
    var variant: CircleButtonVariants = .primary
    var onMaterial: Bool = false
    var action: () -> Void = placeholderAction
    
    var foregroundColor: Color {
            switch variant {
            case .primary: return .black
            case .secondary: return Color(uiColor: .secondaryLabel)
            }
        }
    var buttonTint: Color {
            switch variant {
            case .primary: return .accentColor
            case .secondary: return onMaterial ? Color(UIColor.tertiarySystemFill) : Color(UIColor.secondarySystemFill)
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
                    .frame(width: 34, height: 34)
            }
        }
        .frame(height: 34)
        .frame(width: 34)
        .buttonStyle(.borderedProminent)
        .tint(buttonTint)
        .cornerRadius(999)
        .if(variant == .primary, transform: {view in
            view.shadow(color: Color(red: 0.85, green: 0.98, blue: 0.31).opacity(0.35), radius: 12, x: 0, y: 4)

        })

    }
}

struct SGCirclexButton_Previews: PreviewProvider {
    private var isPreviewDisabled = true
    static var previews: some View {
        VStack(spacing: 16) {
            SGCircleButton(symbol: Image(systemName: "star.fill"))
            SGCircleButton(symbol: Image(systemName: "gear"), variant: .secondary, onMaterial: true)
            SGCircleButton(symbol: Image(systemName: "square.and.arrow.up"), variant: .secondary, onMaterial: false)
        }
    }
}
