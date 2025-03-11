// Copyright © InstaReal. All rights reserved.

import Foundation

public struct Comment: Equatable, Identifiable, Hashable, Decodable {
    
    public let id: UUID
    public let comment: String
    public let profilePicture: String
    
    public init(id: UUID, comment: String, profilePicture: String) {
        self.id = id
        self.comment = comment
        self.profilePicture = profilePicture
    }
}
