// Copyright © InstaReal. All rights reserved.

import Foundation

public struct Post: Equatable, Identifiable, Hashable, Decodable {
    
    public let id: UUID
    public let user: User
    public let comments: [Comment]
    public let imageUrl: String
    public let caption: String
    public let location: String
    public let likeCount: Int
    public let commentCount: Int
    public let shareCount: Int
    public let createdAt: Date
}
