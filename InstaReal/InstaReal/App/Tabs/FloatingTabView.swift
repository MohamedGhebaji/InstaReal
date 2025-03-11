// Copyright © InstaReal. All rights reserved.

import SwiftUI

import DesignSystem

struct FloatingTabView: View {
    
    @Binding private var activeTab: AppTab
    private let capturePhotoAction: () -> ()
    
    init(
        activeTab: Binding<AppTab>,
        capturePhotoAction: @escaping () -> Void
    ) {
        self._activeTab = activeTab
        self.capturePhotoAction = capturePhotoAction
    }
    
    @Namespace private var animation
    @State private var tabLocation: CGRect = .zero
    @State private var heights: [CGFloat] = [40, 40, 40]
    @State private var isAnimating: Bool = true
    private let tabs: [AppTab] = AppTab.allCases
    
    var body: some View {
        HStack(spacing: 16) {
            HStack(spacing: 20) {
                ForEach(tabs, id: \.rawValue) { tab in
                    Button {
                        if activeTab == tab {
//                            popToRoot(tab)
                        }
                        withAnimation {
                            activeTab = tab
                        }
                    } label: {
                        HStack(spacing: 8) {
                            if activeTab == tab {
                                tab.iconFilled.swiftUIImage
                                    .resizable()
                                    .foregroundStyle(AppAsset.Colors.appWhite.swiftUIColor)
                                    .frame(width: 20, height: 20)
                                
                                IRText(tab.title, style: .titleMedium, color: AppAsset.Colors.appWhite.swiftUIColor)
                            } else {
                                tab.iconStroked.swiftUIImage
                                    .resizable()
                                    .foregroundStyle(AppAsset.Colors.appMain.swiftUIColor)
                                    .frame(width: 20, height: 20)
                            }
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 12)
                        .contentShape(Rectangle())
                        .background {
                            if activeTab == tab {
                                Capsule()
                                    .fill(AppAsset.Colors.appMain.swiftUIColor)
                            }
                        }
                    }
                }
                
            }
            .background(alignment: .leading) {
                Capsule()
                    .fill(AppAsset.Colors.appMain.swiftUIColor.gradient)
                    .frame(width: tabLocation.width, height: tabLocation.height)
                    .offset(x: tabLocation.minX)
            }
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(
                AppAsset.Colors.appWhite.swiftUIColor
                    .shadow(.drop(color: .black.opacity(0.08), radius: 5, x: 5, y: 5))
                    .shadow(.drop(color: .black.opacity(0.06), radius: 5, x: -5, y: -5)),
                in: Capsule()
            )
            
            Button {
                capturePhotoAction()
            } label: {
                AppAsset.Icons.icPhoto.swiftUIImage
                    .resizable()
                    .frame(width: 55, height: 55)
                    .foregroundStyle(AppAsset.Colors.appMain.swiftUIColor)
            }
        }
        .padding(.bottom, 10)
        .padding(.horizontal, .medium2)
        .animation(.smooth(duration: 0.3, extraBounce: 0), value: activeTab)
    }
}
