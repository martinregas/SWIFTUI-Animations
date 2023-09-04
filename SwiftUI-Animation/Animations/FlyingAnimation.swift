//
//  FlyingAnimation.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 03/09/2023.
//

import SwiftUI

struct FlyingAnimation: ViewModifier {
    @State private var x: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var degress: Double = 0
    @State private var rotate3D: CGFloat = 0

    @State private var animate: Bool = false

    
    @Binding var type: AnimationType

    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .offset(x: x)
            .rotationEffect(.degrees(degress), anchor: .center)
            .rotation3DEffect(.degrees(rotate3D), axis: (x: 0, y: 1, z: 0))
            .onChange(of: type) { _ in
                if type == .flying {
                     animating()
                }
            }
    }
    
    func animating() {
        for index in 1...360 {
            withAnimation(.easeOut(duration: 0.01).delay(0.01*Double(index))) {
                degress+=1
            }
        }

        withAnimation(.easeInOut(duration: 2)) {
            x = 100
        }
        
        withAnimation(.easeInOut(duration: 1)) {
            scale = 0.5
            rotate3D = -45
        }
        
        withAnimation(.easeInOut(duration: 1.8).delay(2)) {
            scale = 1
            x = 0
            rotate3D = 0
        }
        
        runAsync(after: 3.5) {
            type = .none
        }
    }
}
