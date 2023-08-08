//
//  ContentView.swift
//  StageGuide
//
//  Created by Piergiorgio Gonni on 2023-08-02.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive = true
    @State var canTouchDown = true
    @State var isPressed = false
    
    var body: some View {
        VStack(spacing: 24) {
            SGLiveBadge(size: .medium)
            Text("Hello, StageGuide!")
                .fontWeight(.bold)
            
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
                .frame(maxWidth: .infinity, alignment: .leading)
                SGAddButton(isActive: $isActive){
                    isActive.toggle()
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color(UIColor.secondarySystemFill))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .scaleEffect(isPressed ? 0.9 : 1)
            .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 7), value: isPressed)
            .gesture(DragGesture(minimumDistance: 0.0)
                .onChanged{ _ in
                    if canTouchDown {
                        isPressed = true
                    }
                    canTouchDown = false
                } .onEnded { _ in
                    isPressed = false
                    canTouchDown = true
                }
            )
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
