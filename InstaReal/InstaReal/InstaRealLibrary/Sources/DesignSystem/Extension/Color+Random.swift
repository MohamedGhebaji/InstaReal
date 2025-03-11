// Copyright © InstaReal. All rights reserved.

import SwiftUI

public extension Color {
    
    static var random: Color {
        [
            AppAsset.Colors.lightBeige,
            AppAsset.Colors.lightBleu,
            AppAsset.Colors.lightGreen,
            AppAsset.Colors.lightOrange,
            AppAsset.Colors.lightPink,
            AppAsset.Colors.lightPurple,
            AppAsset.Colors.lightRed,
            AppAsset.Colors.lightYellow
        ].randomElement()!.swiftUIColor
    }
}
