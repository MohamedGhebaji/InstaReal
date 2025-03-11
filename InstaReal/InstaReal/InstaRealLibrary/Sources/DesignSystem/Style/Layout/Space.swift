// Copyright © InstaReal. All rights reserved.

import Foundation

public enum Space: String, CaseIterable, Sendable {

    case none
    /// Spacing of 2 pixels
    case small1
    /// Spacing of 4 pixels
    case small2
    /// Spacing of 6 pixels
    case small3
    /// Spacing of 8 pixels
    case small4
    /// Spacing of 12 pixels
    case medium1
    /// Spacing of 16 pixels
    case medium2
    /// Spacing of 24 pixels
    case medium3
    /// Spacing of 32 pixels
    case large1
    /// Spacing of 48 pixels
    case large2
    /// Spacing of 64 pixels
    case large3
    /// Spacing of 80 pixels
    case large4
    
    var value: CGFloat {
        switch self {
            case .none: 0
            case .small1: 2
            case .small2: 4
            case .small3: 6
            case .small4: 8
            case .medium1: 12
            case .medium2: 16
            case .medium3: 24
            case .large1: 32
            case .large2: 48
            case .large3: 64
            case .large4: 80
        }
    }
}
