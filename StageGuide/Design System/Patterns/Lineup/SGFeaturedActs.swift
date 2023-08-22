//
//  SGFeaturedActs.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-22.
//

import SwiftUI

struct SGFeaturedActs: View {
    private let persistenceController = PersistenceController.shared
    var featuredActs: [Act]
    
    var body: some View {
        HStack {
            Text("Featured artists")
                .font(.title3)
                .fontWeight(.semibold)
            Spacer()
            Button {
                persistenceController.deleteAllData()
            } label: {
                Text("Reset data")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(featuredActs.sorted(by: { $0.startTime ?? Date() > $1.startTime ?? Date()}) , id: \.self.id) { act in
                    let actViewModel = ActViewModel(act: act){
                        // toggle
                    }
                    SGActFeatured(viewModel: actViewModel)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
        .padding(0)
    }
}

//#Preview {
//    SGFeaturedActs()
//}
