//
//  SGAddButton.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-04.
//

import SwiftUI

struct SGAddButton: View {
    
    enum AddButtonVariants {
        case floating
        case edge
    }
    
    @Binding var isActive: Bool
    var variant: AddButtonVariants = .floating
    var action: () -> Void = placeholderAction
    
    private var symbol: String {
        switch isActive {
        case true: return "checkmark.circle.fill"
        case false: return "plus"
        }
    }
    
    private var foregroundColor: Color {
            switch isActive {
            case true: return .black
            case false: return .accentColor
            }
        }
    
    private var buttonHeight: CGFloat {
            switch variant {
            case .floating: return 40
            case .edge: return 56
            }
        }
    
    private var buttonWidth: CGFloat {
            switch variant {
            case .floating: return 40
            case .edge: return 34
            }
        }
    
    private var cornerRadius: CGFloat {
            switch variant {
            case .floating: return 9999
            case .edge: return 0
            }
        }
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: isActive ? "checkmark.circle.fill" : "plus")
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .foregroundColor(foregroundColor)
                    .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        }
        .if(isActive, transform: {view in
            view.buttonStyle(.borderedProminent)
        })
        .background(.regularMaterial)
        .frame(width: buttonWidth, height: buttonHeight, alignment: .center)
        .cornerRadius(cornerRadius)

    }
}

// -----------------------------------
// PREVIEW
struct SGAddButton_Previews: PreviewProvider {
    static var previews: some View {
        @State var placeholderActive = true
        
        VStack {
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Just a preview")
                        .font(.callout)
                        .bold()
                    Text("Aberdeen")
                        .font(.callout)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                    Text("10:30pm-11:30pm")
                        .font(.callout)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                SGAddButton(isActive: $placeholderActive)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(UIColor.secondarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            
            HStack(spacing: 12) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Just a preview")
                        .font(.callout)
                        .bold()
                    Text("10:30pm-11:30pm")
                        .font(.caption)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
                SGAddButton(isActive: $placeholderActive, variant: .edge).frame(maxHeight: .infinity)
            }
            .padding(.leading, 8)
            .padding(.trailing, 0)
            .frame(height: 56)
            .background(Color(UIColor.secondarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
        }
    }
}
