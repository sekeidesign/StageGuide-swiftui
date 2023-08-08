//
//  SGButton.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-03.
//

import SwiftUI

struct SGButton: View {
    
    enum ButtonVariants {
        case primary
        case secondary
        case destructive
    }
    
    var label: Text = Text("Label")
    var variant: ButtonVariants = .primary
    var isDisabled = false
    var action: () -> Void = placeholderAction
    
    var textColor: Color {
            switch variant {
            case .primary:            return !self.isDisabled ? .black : Color(UIColor.tertiaryLabel)
            case .secondary:          return !self.isDisabled ? .accentColor : Color(UIColor.tertiaryLabel)
            case .destructive:            return !self.isDisabled ? Color(UIColor.systemRed) : Color(UIColor.tertiaryLabel)
            }
        }
    var buttonTint: Color {
            switch variant {
                case .primary:            return !self.isDisabled ? .accentColor : Color(UIColor.tertiarySystemFill)
                case .secondary:          return !self.isDisabled ? .accentColor.opacity(0.15) : Color(UIColor.tertiarySystemFill)
                case .destructive:        return !self.isDisabled ? .red.opacity(0.15) : Color(UIColor.tertiarySystemFill)
            }
        }
    
    var body: some View {
        Button{
            action()
        } label: {
            label
                .foregroundColor(textColor)
                .frame(height: 44)
                .frame(minWidth: 140)
                .padding(.horizontal, 16)
                .font(.headline)
        }
        .buttonStyle(.borderedProminent)
        .tint(buttonTint)
        .cornerRadius(12)
        .disabled(isDisabled)
    }
}

struct SGButton_Previews: PreviewProvider {
    private var isPreviewDisabled = true
    static var previews: some View {
        VStack(spacing: 16) {
            SGButton(variant: .primary)
            SGButton(variant: .secondary)
            SGButton(variant: .destructive)
        }
    }
}
