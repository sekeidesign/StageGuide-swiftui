//
//  SGTopNav.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-24.
//

import SwiftUI

struct SGTopNav: View {
    @AppStorage("HasOpenedSettings") private var hasOpenedSettings: Bool = UserDefaults.standard.bool(forKey: "HasOpenedSettings")
    @State private var isSettingsPresented = false
    
    var body: some View {
        HStack {
            Text("Riverside Festival")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            ZStack(alignment: .topTrailing) {
                SGPillButton(symbol: Image(systemName: "gear")){
                    isSettingsPresented = true
                }
                ZStack {
                    Circle()
                        .fill(.red)
                        .frame(width: 12, height: 12)
                    Circle()
                        .strokeBorder(.black, lineWidth: 2)
                        .frame(width: 16, height: 16)
                }
                .offset(x: 4, y: -4)
                .isHidden(hasOpenedSettings, remove: true)
            }
            .navigationDestination(isPresented: $isSettingsPresented) {
                Text("Settings")
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    SGTopNav()
}
