//
//  ContentView.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 27/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State var amount: Double = 1
    @State var speed: Double = 0.975
    @State var vAnimationOn: Bool = false
    @State var hAnimationOn: Bool = false
    @State var animationType: AnimationType = .none
    
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Toggle(isOn: $vAnimationOn) {
                    Text(Constants.vAnimation)
                        .foregroundColor(.white)
                }
                .toggleStyle(CheckboxToggleStyle(color: .primaryOrange))
                
                Toggle(isOn: $hAnimationOn) {
                    Text(Constants.hAnimation)
                        .foregroundColor(.white)
                }
                .toggleStyle(CheckboxToggleStyle(color: .primaryRed))
            }
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            ZStack {
                SwiftView(animationType: $animationType)
                SphereView(amount: $amount, speed: $speed, vAnimationOn: $vAnimationOn, hAnimationOn: $hAnimationOn)
            }
            .aspectRatio(1, contentMode: .fit)
            
            Spacer()
        
            HStack {
                ForEach(AnimationType.all, id: \.self) { type in
                    Button(type.title) {
                        animationType = type
                    }
                    .disabled(animationType != .none)
                    .buttonStyle(AnimationButtonStyle(isSelected: animationType == type))
                    
                }
            }
            .frame(maxWidth: .infinity)
            
            Divider()
                .padding(.bottom, 10)
 
            VStack(spacing: 20) {
                GradientSlider(value: $amount, colors: [.primaryOrange, .primaryRed], range: 1...180, step: 1, title: Constants.size, minTitle: Constants.min, maxTitle: Constants.max)
                    .frame(height: 40)
                
                GradientSlider(value: $speed, colors: [.primaryOrange, .primaryRed], range: 0.95...1, step: 0.0001, title: Constants.speed, minTitle: Constants.min, maxTitle: Constants.max)
                    .frame(height: 40)
            }
        }
        .padding(30)
        .background(
            LinearGradient(gradient: Gradient(colors: [.darkBlue,  .lightBlue]), startPoint: .topLeading, endPoint: .bottomTrailing)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
