// Copyright © InstaReal. All rights reserved.

import SwiftUI

public enum IRTextStyle: String {
    case headlineLarge
    case headlineMedium
    case headlineSmall
    case titleExtraLarge
    case titleLarge
    case titleMedium
    case titleSmall
    case textLarge
    case textMedium
    case textSmall
    case buttonLarge
    case buttonMedium
    case buttonSmall
    case paragraphSubtitleLarge
    case paragraphSubtitleMedium
    case paragraphSubtitleSmall
    case paragraphTextLarge
    case paragraphTextMedium
    case paragraphTextSmall
}

// MARK: - Public properties

public extension IRTextStyle {

    var font: SwiftUI.Font {
        SwiftUI.Font(uifont)
    }

    var uifont: UIFont {
        switch self {
            case .headlineLarge:
                return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
                    for: FontFamily.Outfit.bold.font(size: 32),
                    maximumPointSize: 48
                )
            case .headlineMedium:
                return UIFontMetrics(forTextStyle: .title1).scaledFont(
                    for: FontFamily.Outfit.bold.font(size: 28),
                    maximumPointSize: 44
                )
            case .headlineSmall:
                return UIFontMetrics(forTextStyle: .title2).scaledFont(
                    for: FontFamily.Outfit.bold.font(size: 24),
                    maximumPointSize: 42
                )
            case .titleExtraLarge:
                return UIFontMetrics(forTextStyle: .title3).scaledFont(
                    for: FontFamily.Outfit.semiBold.font(size: 20),
                    maximumPointSize: 40
                )
            case .titleLarge:
                return UIFontMetrics(forTextStyle: .title3).scaledFont(
                    for: FontFamily.Outfit.semiBold.font(size: 20),
                    maximumPointSize: 40
                )
            case .titleMedium:
                return UIFontMetrics(forTextStyle: .headline).scaledFont(
                    for: FontFamily.Outfit.semiBold.font(size: 16),
                    maximumPointSize: 32
                )
            case .titleSmall:
                return UIFontMetrics(forTextStyle: .subheadline).scaledFont(
                    for: FontFamily.Outfit.semiBold.font(size: 14),
                    maximumPointSize: 28
                )
            case .textLarge:
                return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 16),
                    maximumPointSize: 32
                )
            case .textMedium:
                return UIFontMetrics(forTextStyle: .headline).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 14),
                    maximumPointSize: 28
                )
            case .textSmall:
                return UIFontMetrics(forTextStyle: .subheadline).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 12),
                    maximumPointSize: 24
                )
            case .buttonLarge:
                return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 16),
                    maximumPointSize: 32
                )
            case .buttonMedium:
                return UIFontMetrics(forTextStyle: .headline).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 14),
                    maximumPointSize: 28
                )
            case .buttonSmall:
                return UIFontMetrics(forTextStyle: .subheadline).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 12),
                    maximumPointSize: 24
                )
            case .paragraphSubtitleLarge:
                return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 16),
                    maximumPointSize: 32
                )
            case .paragraphSubtitleMedium:
                return UIFontMetrics(forTextStyle: .headline).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 14),
                    maximumPointSize: 28
                )
            case .paragraphSubtitleSmall:
                return UIFontMetrics(forTextStyle: .subheadline).scaledFont(
                    for: FontFamily.Outfit.medium.font(size: 12),
                    maximumPointSize: 24
                )
            case .paragraphTextLarge:
                return UIFontMetrics(forTextStyle: .largeTitle).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 16),
                    maximumPointSize: 32
                )
            case .paragraphTextMedium:
                return UIFontMetrics(forTextStyle: .headline).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 14),
                    maximumPointSize: 28
                )
            case .paragraphTextSmall:
                return UIFontMetrics(forTextStyle: .subheadline).scaledFont(
                    for: FontFamily.Outfit.light.font(size: 12),
                    maximumPointSize: 24
                )
        }
    }
}

// MARK: - Private properties

private extension IRTextStyle {

    var lineHeight: CGFloat {
        switch self {
            case .headlineLarge: 36
            case .headlineMedium: 32
            case .headlineSmall: 28
            case .titleExtraLarge: 24
            case .titleLarge: 24
            case .titleMedium: 20
            case .titleSmall: 16
            case .textLarge: 18
            case .textMedium: 16
            case .textSmall: 14
            case .buttonLarge: 24
            case .buttonMedium: 20
            case .buttonSmall: 16
            case .paragraphSubtitleLarge: 22
            case .paragraphSubtitleMedium: 20
            case .paragraphSubtitleSmall: 18
            case .paragraphTextLarge: 22
            case .paragraphTextMedium: 20
            case .paragraphTextSmall: 18
        }
    }
}
