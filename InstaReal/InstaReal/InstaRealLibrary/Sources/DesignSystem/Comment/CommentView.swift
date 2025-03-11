// Copyright © InstaReal. All rights reserved.

import SwiftUI

import NukeUI

public struct CommentState: Equatable, Identifiable {
    
    public let id: UUID
    let text: String
    let profilePictureUrl: String
    
    public init(id: UUID, text: String, profilePictureUrl: String) {
        self.id = id
        self.text = text
        self.profilePictureUrl = profilePictureUrl
    }
}

public struct CommentView: View {
    
    private let state: CommentState
    
    public init(state: CommentState) {
        self.state = state
    }
    
    public var body: some View {
        IRHStack(spacing: .small3) {
            LazyImage(url: URL(string: state.profilePictureUrl)) { state in
                if let image = state.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } else {
                    SpinnerView()
                        .frame(width: 10, height: 10)
                }
            }
            
            IRText(state.text, style: .titleMedium, color: AppAsset.Colors.appBlack.swiftUIColor)
        }
    }
}
