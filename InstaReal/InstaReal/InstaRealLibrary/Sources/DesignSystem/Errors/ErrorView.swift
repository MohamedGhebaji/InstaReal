// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct ErrorView: View {
    
    private let action: () async -> Void
    public init(action: @escaping () async -> Void) {
        self.action = action
    }
    
    public var body: some View {
        IRVStack(spacing: .medium2) {
            IRText("Une erreur est survenue. Merci de réessayer", style: .textLarge, color: AppAsset.Colors.appBlack.swiftUIColor)
            
            IRPrimaryButton(title: "Réessayer") {
                Task {
                    await action()
                }
            }
        }
        .padding()
        .infinite()
    }
}
