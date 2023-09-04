//
//  CheckboxToggleStyle.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 29/08/2023.
//

import SwiftUI

struct CheckboxToggleStyle: ToggleStyle {
    var color: Color
    
    init(color: Color) {
        self.color = color
    }
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 12) {
 
            RoundedRectangle(cornerRadius: 3.0)
                .stroke(color, lineWidth: 3)
                .frame(width: 24, height: 24)
                .background(color.opacity(0.2))
                .cornerRadius(3)
                .overlay (
                    Image(systemName: configuration.isOn ? "checkmark" : "")
                        .frame(width: 24, height: 24)
                        .background(configuration.isOn ? color : .clear)
                        .font(.system(size: 12, weight: .black))
                        .foregroundColor(.white)
                        .cornerRadius(3)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        configuration.isOn.toggle()
                    }
                }
 
            configuration.label
        }
    }
}
