// Copyright © InstaReal. All rights reserved.

import Foundation

public protocol UUIDClient {
    
    func uuid() -> UUID
}

public struct IRUUIDClient: UUIDClient {
    
    public init() {}
    
    public func uuid() -> UUID {
        return UUID()
    }
}
