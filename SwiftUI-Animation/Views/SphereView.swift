//
//  SphereView.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 31/08/2023.
//

import SwiftUI

struct SphereView: View {
    @Binding var amount: Double
    @Binding var speed: Double
    @Binding var vAnimationOn: Bool
    @Binding var hAnimationOn: Bool
    
    @State private var mainDegree: Int = 0
    
    var body: some View {
        ForEach(0..<Int(amount), id : \.self) { i in
            if vAnimationOn {
                Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
                    .stroke(Color.primaryOrange, lineWidth: 2)
                    .rotation3DEffect(.degrees(degressBy(index: i)), axis: (x: 0, y: 1, z: 0))
                    .zIndex(degressBy(index: i) > 180 ? 0 : 1)
            }
            
            if hAnimationOn {
                Arc(startAngle: .degrees(180), endAngle: .degrees(0), clockwise: true)
                    .stroke(Color.primaryRed, lineWidth: 2)
                    .rotation3DEffect(.degrees(degressBy(index: i)), axis: (x: 1, y: 0, z: 0))
                    .zIndex(degressBy(index: i) > 180 ? 0 : 1)
            }
        }
        .onLoad {
            animate()
        }
    }
    
    func degressBy(index: Int) -> Double {
        let degree = Double(mainDegree+index*2)
        return degree > 360 ? degree - 360 : degree
    }
    
    func animate() {
        withAnimation(.linear(duration: speed).repeatForever(autoreverses: false)) {
            updateDegree()
        }
    }
    
    func updateDegree() {
        runAsync(after: 1 - speed) {
            mainDegree = mainDegree >= 360 ? 0 : mainDegree+1
            updateDegree()
        }
    }
}

struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)
        return path
    }
}
