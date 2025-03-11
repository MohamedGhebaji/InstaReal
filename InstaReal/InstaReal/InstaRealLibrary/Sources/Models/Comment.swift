// Copyright © InstaReal. All rights reserved.

import Foundation

public struct Comment: Equatable, Identifiable, Hashable, Decodable {
    
    public let id: UUID
    public let comment: String
    public let profilePicture: String
}
