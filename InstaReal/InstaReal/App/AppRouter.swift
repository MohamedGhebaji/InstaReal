// Copyright © InstaReal. All rights reserved.

import Foundation

import SwiftUI

import Router
import PostDetail

extension View {
    func withAppRouteur() -> some View {
        self.navigationDestination(for: RouteurDestinations.self) { destination in
            switch destination {
                case let .postDetail(id):
                    PostDetailView(postId: id)
            }
        }
    }
    
    func withSheetDestinations(sheetDestinations: Binding<SheetDestinations?>) -> some View {
        self.fullScreenCover(item: sheetDestinations) { destination in
            switch destination {
                case .paywall:
                    EmptyView()
            }
        }
    }
}
