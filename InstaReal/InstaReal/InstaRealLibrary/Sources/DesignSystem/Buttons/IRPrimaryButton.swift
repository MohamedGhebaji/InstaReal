// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct IRPrimaryButton: View {

    private let title: String
    private let size: CGFloat
    private let padding: CGFloat
    private let fullWidth: Bool
    private let action: () -> Void

    public init(
        title: String,
        size: CGFloat = 18,
        padding: CGFloat = 16,
        fullWidth: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.size = size
        self.padding = padding
        self.fullWidth = fullWidth
        self.action = action
    }

    public var body: some View {
        Button {
            action()
        } label: {
            IRText(title, style: .buttonMedium, color: AppAsset.Colors.appWhite.swiftUIColor)
                .frame(maxWidth: .infinity)
                .padding(padding)
        }
        .background {
            RoundedRectangle(cornerRadius: 25)
                .fill(AppAsset.Colors.appMain.swiftUIColor)
        }
    }
}
