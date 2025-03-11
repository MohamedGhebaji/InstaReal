// Copyright © InstaReal. All rights reserved.

import Foundation

public enum Route {
    
    case stories
    case posts
    case post(id: UUID)
    
    public var mockFileName: String {
        switch self {
            case .stories: "stories_mock"
            case .posts: "posts_mock"
            case .post: "posts_mock"
        }
    }
}
