// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct IRText: View {

    // MARK: - Constant

    private enum Constant {
        static let disabledOpacity: CGFloat = 0.4
    }

    // MARK: - Var

    private let text: Text
    private let style: IRTextStyle
    private let color: Color

    // MARK: - Init

    public init(_ text: Text, style: IRTextStyle, color: Color) {
        self.text = text
        self.style = style
        self.color = color
    }

    public init<S>(_ text: S, style: IRTextStyle, color: Color) where S: StringProtocol {
        self.text = Text(text)
        self.style = style
        self.color = color
    }

    // MARK: - Body

    public var body: some View {
        text
            .multilineTextAlignment(.leading)
            .foregroundColor(color)
            .font(style.font)
    }
}
