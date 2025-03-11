// Copyright © InstaReal. All rights reserved.

import Foundation

public enum Radius: String, CaseIterable, Sendable {

    case none
    case xs
    case s
    case m
    case l
    case xl
    
    var value: CGFloat {
        switch self {
            case .none: 0
            case .xs: 4
            case .s: 8
            case .m: 16
            case .l: 24
            case .xl: 32
        }
    }
}
