//
//  JumpingAnimation.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 03/09/2023.
//

import SwiftUI

struct JumpingAnimation: ViewModifier {
    @State private var y: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var rotate: CGFloat = 0

    @Binding var type: AnimationType

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .offset(y: y)
            .onChange(of: type) { _ in
                if type == .jumping {
                     animate()
                }
            }
    }
    
    func animate() {
        withAnimation(.easeOut(duration: 0.5)) {
            scale = 0.8
        }
        
        withAnimation(.easeOut(duration: 0.5).delay(0.5)) {
            y = -40
            rotate = -15
        }
        
        withAnimation(.easeOut(duration: 0.5).delay(1)) {
            y = 0
            rotate = -0
        }
        
        withAnimation(.easeOut(duration: 0.5).delay(1.5)) {
            scale = 1
        }
        
        runAsync(after: 2) {
            type = .none
        }
    }
}
