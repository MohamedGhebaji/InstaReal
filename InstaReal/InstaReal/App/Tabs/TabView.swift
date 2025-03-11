// Copyright © InstaReal. All rights reserved.

import SwiftUI

import Router

struct TabView: View {
    
    @State var selectedTab: AppTab = .home
    var body: some View {
        ZStack(alignment: .bottom) {
            tabView
            FloatingTabView(
                activeTab: $selectedTab,
                capturePhotoAction: {}
            )
        }
        .ignoresSafeArea(.keyboard)
        .onAppear {
            UITabBar.appearance().isHidden = true
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
