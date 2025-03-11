// Copyright © InstaReal. All rights reserved.

import Foundation

public struct Story: Equatable, Identifiable, Hashable, Decodable {
    
    public let id: UUID
    public let userId: UUID
    public let imageUrl: String
}
