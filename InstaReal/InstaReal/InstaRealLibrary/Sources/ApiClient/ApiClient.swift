// Copyright © InstaReal. All rights reserved.

import Foundation

public protocol ApiClient: Sendable {
    func fetch<T: Decodable>(route: Route, as: T.Type) async throws -> T
}
    
public struct IRApiClient: ApiClient {
    
    public init() {}
    
    public func fetch<T>(route: Route, as: T.Type) async throws -> T where T : Decodable {
        guard let url = Bundle.module.url(forResource: route.mockFileName, withExtension: "json")
        else { throw URLError(.badURL) }
        
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(T.self, from: data)
    }
}
