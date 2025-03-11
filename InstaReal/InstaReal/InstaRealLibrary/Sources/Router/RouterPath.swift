// Copyright © InstaReal. All rights reserved.

import SwiftUI

public final class RouterPath: ObservableObject {
    
    @Published public var path: [RouteurDestinations] = []
    @Published public var presentedSheet: SheetDestinations?
    
    public init() {}
        
    public func navigate(to: RouteurDestinations) {
      path.append(to)
    }
}

public enum RouteurDestinations: Hashable {
    case postDetail(postId: UUID)
}

public enum SheetDestinations: String, Identifiable {
    case paywall
    
    public var id: String {
        rawValue
    }
}

