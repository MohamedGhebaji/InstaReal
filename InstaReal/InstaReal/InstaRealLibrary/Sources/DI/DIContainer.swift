// Copyright © InstaReal. All rights reserved.

import Foundation

import ApiClient
import UUIDClient

public class DIContainer {
    
    public static let shared = DIContainer()
    public let apiClient: ApiClient = IRApiClient()
    public let uuidClient: UUIDClient = IRUUIDClient()
}
