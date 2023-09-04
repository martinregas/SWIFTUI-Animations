//
//  SwiftView.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 31/08/2023.
//

import SwiftUI

struct SwiftView: View {
    @Binding var animationType: AnimationType
    
    var body: some View {
        Image(systemName: "swift")
            .renderingMode(.template)
            .resizable()
            .foregroundColor(.primaryBlack)
            .scaledToFit()
            .padding(60)
            .zIndex(0.5)
            .modifier(PeckingAnimation(type: $animationType))
            .modifier(JumpingAnimation(type: $animationType))
            .modifier(FlyingAnimation(type: $animationType))
    }
}
