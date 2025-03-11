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
    
    public init(
        id: UUID,
        user: User,
        comments: [Comment],
        imageUrl: String,
        caption: String,
        location: String,
        likeCount: Int,
        commentCount: Int,
        shareCount: Int,
        createdAt: Date
    ) {
        self.id = id
        self.user = user
        self.comments = comments
        self.imageUrl = imageUrl
        self.caption = caption
        self.location = location
        self.likeCount = likeCount
        self.commentCount = commentCount
        self.shareCount = shareCount
        self.createdAt = createdAt
    }
}
