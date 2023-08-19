//
//  SGReadMore.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-19.
//

import SwiftUI

struct SGReadMore: View {
    let originalText: String
    let maxLines: Int
    
    @State private var showFullText = false
    
    private var truncatedText: String {
        let lines = originalText.split(separator: "\n")
        if lines.count > maxLines {
            let truncatedLines = lines.prefix(maxLines)
            return truncatedLines.joined(separator: "\n")
        }
        return originalText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(showFullText ? originalText : truncatedText)
                .lineLimit(showFullText ? nil : maxLines)
                .font(.subheadline)
                .foregroundColor(Color(uiColor: .secondaryLabel))
            if originalText.split(separator: "\n").count < maxLines {
                if !showFullText {
                    Button(action: {
                        showFullText.toggle()
                    }) {
                        Text("Read more")
                            .font(.subheadline)
                    }
                } else if showFullText {
                    Button(action: {
                        
                        showFullText.toggle()
                        
                    }) {
                        Text("Read less")
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}

//#Preview {
//    SGReadMore()
//}
