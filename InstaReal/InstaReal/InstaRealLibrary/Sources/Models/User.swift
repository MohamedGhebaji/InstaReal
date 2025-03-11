// Copyright © InstaReal. All rights reserved.

import Foundation

public struct User: Equatable, Identifiable, Hashable, Decodable {
    
    public let id: UUID
    public let username: String
    public let email: String
    public let profilePicture: String
    public let bio: String
    public let followersCount: Int
    public let followingCount: Int
    
    public init(
        id: UUID,
        username: String,
        email: String,
        profilePicture: String,
        bio: String,
        followersCount: Int,
        followingCount: Int
    ) {
        self.id = id
        self.username = username
        self.email = email
        self.profilePicture = profilePicture
        self.bio = bio
        self.followersCount = followersCount
        self.followingCount = followingCount
    }
}
