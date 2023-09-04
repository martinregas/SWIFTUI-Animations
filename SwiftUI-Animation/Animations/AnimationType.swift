//
//  AnimationsType.swift
//  SwiftUI-Animation
//
//  Created by Martin Regas on 03/09/2023.
//

import Foundation

enum AnimationType: Equatable {
    case pecking
    case jumping
    case flying
    case none
    
    static var all: [AnimationType] {
        return [.pecking, .jumping, .flying]
    }
    
    var title: String {
        switch self {
        case .pecking: return Constants.peck
        case .jumping: return Constants.jump
        case .flying: return Constants.fly
        case .none: return String()
        }
    }
}
