// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct IRVStack<Content: View>: View {

    private let alignment: HorizontalAlignment
    private let spacing: Space
    private let content: Content

    public init(
        alignment: HorizontalAlignment = .center,
        spacing: Space = .none,
        @ViewBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        VStack(alignment: alignment, spacing: spacing.value, content: { content })
    }
}
