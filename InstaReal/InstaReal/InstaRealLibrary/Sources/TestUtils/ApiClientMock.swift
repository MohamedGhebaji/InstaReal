// Copyright © InstaReal. All rights reserved.

import Foundation

import ApiClient

public struct ApiClientMock<T: Decodable>: ApiClient {
    
    public enum StubType {
        case success(T)
        case failure(Error)
    }
    private let stubType: StubType
    public init(stubType: StubType) {
        self.stubType = stubType
    }
    
    public func fetch<T>(route: Route, as: T.Type) async throws -> T where T : Decodable {
        switch stubType {
            case .success(let model):
                return model as! T
            case .failure(let error):
                throw error
        }
    }
}
