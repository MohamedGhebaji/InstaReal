// Copyright © InstaReal. All rights reserved.

import SwiftUI

import Router

struct TabView: View {
    
    @StateObject private var routeurPath = RouterPath()
    @State var selectedTab: AppTab = .home
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                tabView
                FloatingTabView(
                    activeTab: $selectedTab,
                    capturePhotoAction: {}
                )
            }
            .withAppRouteur()
            .withSheetDestinations(sheetDestinations: $routeurPath.presentedSheet)
            .ignoresSafeArea(.keyboard)
            .onAppear {
                UITabBar.appearance().isHidden = true
            }
            .environmentObject(routeurPath)
        }
    }
}

private extension TabView {
    
    @ViewBuilder
    var tabView: some View {
        SwiftUI.TabView(selection: $selectedTab) {
            ForEach(AppTab.allCases) { tab in
                tab.makeContentView()
            }
        }
    }
}
