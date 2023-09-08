//
//  SGLiveBadge.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

struct SGLiveBadge: View {
    enum LiveBadgeSizes {
        case small
        case medium
    }
    
    var size: LiveBadgeSizes = .small
    
    var body: some View {
        
        let label = size == .small ? "Live" : "Live Now"
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: "dot.radiowaves.left.and.right")
                    .font(.system(size: 10))
                    .frame(width: 16, height: 16)
                    .foregroundColor(.black)
                    .isHidden(size == .small, remove: true)
                Text(label)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .kerning(0.4)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .textCase(.uppercase)
            }
            .padding(.horizontal, 6)
            .padding(.vertical, 2)
            .background(Color.accentColor)
            .cornerRadius(99999)
            .shadow(color: Color(red: 0.85, green: 0.98, blue: 0.31).opacity(0.5), radius: 12, x: 0, y: 1)
        }
}

struct SGLiveBadge_Previews: PreviewProvider {
    static var previews: some View {
        SGLiveBadge(size: .medium)
    }
}
