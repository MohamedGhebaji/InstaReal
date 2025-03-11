// Copyright © InstaReal. All rights reserved.

import Foundation

import UUIDClient

public struct UUIDClientMock: UUIDClient {
    
    private let stub: UUID
    public init(stub: UUID) {
        self.stub = stub
    }
    
    public func uuid() -> UUID {
        stub
    }
}
