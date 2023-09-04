//
//  Utils.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 03/09/2023.
//

import Foundation

func runAsync(after seconds: Double, queue: DispatchQueue = .main, _ completion: @escaping () -> Void) {
    queue.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
