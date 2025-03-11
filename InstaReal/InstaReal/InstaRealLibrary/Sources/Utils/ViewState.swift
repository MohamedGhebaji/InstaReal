// Copyright © InstaReal. All rights reserved.

import Foundation

public enum ViewState<T: Equatable>: Equatable {
    case loading
    case success(T)
    case failure
}
