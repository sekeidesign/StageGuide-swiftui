//
//  SGLinkList.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-23.
//

import SwiftUI
import WrappingHStack

struct SGLinkList: View {
    var links: [String]
    
    var body: some View {
        WrappingHStack(links, id: \.self, spacing: .constant(8)) { link in
                SGPillButton(link: link)
                .padding(.bottom, 8)
        }
        .frame(maxWidth: .infinity)
    }
}

//#Preview {
//    SGLinkList()
//}
