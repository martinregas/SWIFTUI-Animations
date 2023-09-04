//
//  PeckingAnimation.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 01/09/2023.
//

import SwiftUI

struct PeckingAnimation: ViewModifier {
    @State private var scale: CGFloat = 1
    @State private var rotate: CGFloat = 0
    @State private var rotate3D: CGFloat = 0
    
    @Binding var type: AnimationType
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(.degrees(rotate3D), axis: (x: 0, y: 1, z: 0))
            .scaleEffect(scale)
            .rotationEffect(.degrees(rotate))
            .onChange(of: type) { _ in
                if type == .pecking {
                    animate()
                }
            }
    }
    
    func animate() {
        withAnimation(.easeOut(duration: 1)) {
            rotate3D = -35
            scale = 0.8
        }
        
        withAnimation(.easeOut(duration: 0.5).delay(1.1)) {
            rotate3D = 0
            scale = 1.1
            rotate+=20
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(1.6)) {
            rotate += 5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(1.7)) {
            rotate -= 5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(1.8)) {
            rotate += 5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(1.9)) {
            rotate -= 5
        }
        
        withAnimation(.easeOut(duration: 0.5).delay(2.0)) {
            rotate3D = 20
            scale = 1.0
        }
        
        withAnimation(.easeIn(duration: 1).delay(2.5)) {
            rotate3D = 0
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(2.6)) {
            rotate+=5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(2.7)) {
            rotate-=5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(2.8)) {
            rotate+=5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(2.9)) {
            rotate-=5
        }
        
        withAnimation(.easeOut(duration: 0.1).delay(3.0)) {
            rotate+=5
        }
        
        withAnimation(.easeOut(duration: 0.2).delay(3.1)) {
            rotate-=25
        }
        
        runAsync(after: 3.3) {
            type = .none
        }
    }
}
