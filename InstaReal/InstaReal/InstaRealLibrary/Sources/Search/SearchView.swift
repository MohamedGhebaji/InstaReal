// Copyright © InstaReal. All rights reserved.

import SwiftUI

public struct SearchView: View {
    
    @StateObject private var viewModel: SearchViewModel
    
    public init() {
        _viewModel = StateObject(wrappedValue: SearchViewModel())
    }
    
    public var body: some View {
        Text("Hello, world!")
    }
}
