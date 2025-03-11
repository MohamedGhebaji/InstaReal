// Copyright © InstaReal. All rights reserved.

import SwiftUI

import Router
import Home

struct HomeTabView: View {
    
    @ObservedObject var routeurPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routeurPath.path) {
            HomeView()
                .withAppRouteur()
                .withSheetDestinations(sheetDestinations: $routeurPath.presentedSheet)
        }
        .environmentObject(routeurPath)
    }
}
