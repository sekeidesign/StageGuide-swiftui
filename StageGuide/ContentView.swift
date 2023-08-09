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
        ScrollView(.horizontal) {
            HStack(spacing: 24) {
                ForEach(friday) { act in
                    SGActFeatured(actName: act.name, actImage: act.image, startTime: act.startTime, endTime: act.endTime, stageName: act.stage, isFavorite: $isActive)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
