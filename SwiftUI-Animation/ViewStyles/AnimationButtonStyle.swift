//
//  AnimationButtonStyle.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 03/09/2023.
//

import SwiftUI

struct AnimationButtonStyle: ButtonStyle {
    var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isSelected ? .primaryOrange : .black)
            .font(.system(size: 16, weight: isSelected ? .black : .regular))
            .frame(maxWidth: .infinity)
            .cornerRadius(4)
    }
}
