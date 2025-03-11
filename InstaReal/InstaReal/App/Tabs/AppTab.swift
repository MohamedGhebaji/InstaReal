// Copyright © InstaReal. All rights reserved.

import SwiftUI

import DesignSystem
import Home

enum AppTab: Int, Identifiable, Hashable, CaseIterable {
    case home, search, account
    
    var id: Int { rawValue }
    var title: String {
        switch self {
            case .home: "Accueil"
            case .search: "Recherche"
            case .account: "Profil"
        }
    }
    var iconStroked: ImageAsset {
        switch self {
            case .home: AppAsset.Icons.icHomeStroked
            case .account: AppAsset.Icons.icAccountStoked
            case .search: AppAsset.Icons.icSearchStroked
        }
    }
    var iconFilled: ImageAsset {
        switch self {
            case .home: AppAsset.Icons.icHomeFilled
            case .account: AppAsset.Icons.icAccountFilled
            case .search: AppAsset.Icons.icSearchFilled
        }
    }
    @ViewBuilder
    func makeContentView() -> some View {
        switch self {
            case .home:
                HomeTabView()
            case .search:
                EmptyView()
            case .account:
                EmptyView()
        }
    }
}
