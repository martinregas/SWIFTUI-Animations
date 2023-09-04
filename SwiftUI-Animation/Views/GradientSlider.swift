//
//  GradientSlider.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 31/08/2023.
//

import SwiftUI

struct GradientSlider: View {
    @Binding var value: Double
    var colors: [Color]
    var range: ClosedRange<Double>
    var step: Double
    
    var title: String?
    var minTitle: String?
    var maxTitle: String?
    
    var body: some View {
        VStack(spacing: 2) {
            if let title = title {
                Text(title)
                    .fontWeight(.medium)
                    .foregroundColor(.primaryBlack)
            }
            
            HStack {
                if let minTitle = minTitle {
                    Text(minTitle)
                        .foregroundColor(.primaryBlack)
                }
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: colors),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(Slider(value: $value, in: range, step: step))
                    
                    Slider(value: $value, in: range, step: step)
                        .opacity(0.05)
                }
                if let maxTitle = maxTitle {
                    Text(maxTitle)
                        .foregroundColor(.primaryBlack)
                }
            }
        }
    }
}
