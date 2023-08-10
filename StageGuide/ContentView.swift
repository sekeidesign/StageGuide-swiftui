//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive = true
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 24) {
                    ForEach(friday) { act in
                        SGActFeatured(act: act, isFavorite: $isActive)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            VStack {
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
