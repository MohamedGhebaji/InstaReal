// Copyright © InstaReal. All rights reserved.

import SwiftUI

import NukeUI
import Pow

public struct PostState: Equatable, Identifiable {
    
    public var id: UUID
    public let parentId: UUID
    let imageUrl: String
    let profilePictureUrl: String
    let username: String
    let caption: String
    public var likeCount: Int
    public var likeCountText: String
    let commentCountText: String
    let shareCountText: String
    let createdAt: String
    public var isLiked: Bool = false
    public var isSeen: Bool = false
    
    public init(
        id: UUID,
        parentId: UUID,
        imageUrl: String,
        profilePictureUrl: String,
        username: String,
        caption: String,
        likeCount: Int,
        likeCountText: String,
        commentCountText: String,
        shareCountText: String,
        createdAt: String
    ) {
        self.id = id
        self.parentId = parentId
        self.imageUrl = imageUrl
        self.profilePictureUrl = profilePictureUrl
        self.username = username
        self.caption = caption
        self.likeCount = likeCount
        self.likeCountText = likeCountText
        self.commentCountText = commentCountText
        self.shareCountText = shareCountText
        self.createdAt = createdAt
    }
}

public struct PostView: View {
    
    private let state: PostState
    private let onTap: () -> Void
    private let onLike: () -> Void

    public init(state: PostState, onTap: @escaping () -> Void, onLike: @escaping () -> Void) {
        self.state = state
        self.onTap = onTap
        self.onLike = onLike
    }
    
    public var body: some View {
        GeometryReader { proxy in
            IRVStack(alignment: .leading, spacing: .small3) {
                IRHStack(spacing: .small2) {
                    LazyImage(url: URL(string: state.profilePictureUrl)) { state in
                        if let image = state.image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        } else {
                            SpinnerView()
                                .frame(width: 10, height: 10)
                        }
                    }
                    IRText(
                        state.username,
                        style: .textSmall,
                        color: AppAsset.Colors.appBlack.swiftUIColor
                    )
                }
                
                LazyImage(url: URL(string: state.imageUrl)) { state in
                    if let image = state.image {
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: proxy.size.width, height: proxy.size.width)
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    } else {
                        SpinnerView()
                            .frame(width: 30, height: 30)
                            .infinite()
                    }
                }
                .animation(.default)
                .onTapGesture(count: 2) {
                    onLike()
                }
                
                Spacer()
                
                IRHStack(spacing: .medium2) {
                    IRHStack(spacing: .small1) {
                        if state.isLiked {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                                .transition(
                                  .movingParts.pop(.red)
                                )
                        } else {
                            Image(systemName: "heart")
                                .foregroundStyle(AppAsset.Colors.appBlack.swiftUIColor)
                        }
                        IRText(
                            state.likeCountText,
                            style: .titleMedium,
                            color: state.isLiked ? .red : AppAsset.Colors.appBlack.swiftUIColor
                        )
                        .animation(state.isLiked ? .default.delay(0.4) : nil, value: state.isLiked)
                    }
                    .onTapGesture {
                        onLike()
                    }
                    
                    IRHStack(spacing: .small1) {
                        AppAsset.Icons.icComment.swiftUIImage
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(AppAsset.Colors.appBlack.swiftUIColor)
                        IRText(state.commentCountText, style: .titleMedium, color: AppAsset.Colors.appBlack.swiftUIColor)
                    }
                    IRHStack(spacing: .small1) {
                        AppAsset.Icons.icShare.swiftUIImage
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(AppAsset.Colors.appBlack.swiftUIColor)
                        IRText(state.shareCountText, style: .titleMedium, color: AppAsset.Colors.appBlack.swiftUIColor)
                    }
                }
                IRHStack(spacing: .small2) {
                    IRText(state.username, style: .titleSmall, color: AppAsset.Colors.appBlack.swiftUIColor)
                    IRText(state.caption, style: .textMedium, color: AppAsset.Colors.appBlack.swiftUIColor)
                }
            }
            .opacity(state.isSeen ? 0.5 : 1)
            .animation(.easeInOut, value: state.isSeen)
            .onTapGesture {
                onTap()
            }
        }
    }
}

