// Copyright © InstaReal. All rights reserved.

import SwiftUI

import NukeUI

public struct StoryState: Equatable, Identifiable {
    
    public let id: UUID
    let imageUrl: String
    let color: Color
    
    public init(id: UUID, imageUrl: String, color: Color) {
        self.id = id
        self.imageUrl = imageUrl
        self.color = color
    }
}

public struct StoryView: View {
    
    private let state: StoryState
    
    public init(state: StoryState) {
        self.state = state
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .stroke(state.color, lineWidth: 2)
            .frame(width: 80, height: 80)
            .overlay {
                LazyImage(url: URL(string: state.imageUrl)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    } else {
                        SpinnerView()
                            .frame(width: 10, height: 10)
                    }
                }
            }
    }
}
