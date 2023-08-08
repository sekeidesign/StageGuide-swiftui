//
//  SGSubscriptionPerk.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-05.
//

import SwiftUI

var symbol: Image = Image(systemName: "app.gift.fill")
var title: Text = Text("Placeholder text")

struct SGSubscriptionPerk: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            symbol
                .font(.system(size: 20, weight: .regular))
                .foregroundColor(.accentColor)
                .frame(width: 24, height: 24)
            
            Text("Home Screen Widgets")
                .font(.callout)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color(uiColor: .label))
                .multilineTextAlignment(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Image("Perks/Live Actions")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 67, alignment: .top)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(width: 88, height: 67, alignment: .topLeading)
            
        }.padding(.trailing, 12)
            .padding(.leading, 12)
            .frame(height: 48)
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .tertiarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}

// extensions
extension Text {
    func textStyle < Style: ViewModifier > (_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}


struct SGSubscriptionPerk_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            SGSubscriptionPerk()
        }
        .frame(maxWidth: .infinity)
        .padding(16)
        .background(Color(uiColor: .systemBackground))
    }
}
