// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct IRHStack<Content: View>: View {

    private let alignment: VerticalAlignment
    private let spacing: Space
    private let content: Content

    public init(
        alignment: VerticalAlignment = .center,
        spacing: Space = .none,
        @ViewBuilder content: () -> Content
    ) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content()
    }

    public var body: some View {
        HStack(alignment: alignment, spacing: spacing.value, content: { content })
    }
}
