// Copyright © InstaReal. All rights reserved.

import SwiftUI

import DesignSystem
import Utils
import Router

public struct HomeView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @EnvironmentObject private var routeurPath: RouterPath
    
    public init() {}
    
    public var body: some View {
        IRVStack(spacing: .small2) {
            switch viewModel.storiesState {
                case .loading:
                    SpinnerView()
                        .frame(width: 30, height: 30)
                case .success(let stories):
                    ScrollView(.horizontal, showsIndicators: false) {
                        IRHStack(spacing: .medium2) {
                            ForEach(stories) { story in
                                StoryView(state: story)
                            }
                        }
                        .padding(.horizontal, .medium2)
                    }
                case .failure:
                    // TODO: Handle get stories failure
                    EmptyView()
            }
            switch viewModel.postsState {
                case .loading:
                    SpinnerView()
                        .frame(width: 30, height: 30)
                case .success(let posts):
                    GeometryReader { proxy in
                        List {
                            Group {
                                ForEach(posts) { post in
                                    PostView(
                                        state: post,
                                        onTap: {
                                            routeurPath.navigate(to: .postDetail(postId: post.parentId))
                                            viewModel.didSelectPost(post)
                                        },
                                        onLike: {
                                            viewModel.didLikePost(post)
                                        }
                                    )
                                    .frame(height: proxy.size.width + 60)
                                    .padding(.vertical, 16)
                                }
                                
                                if viewModel.canLoadMore {
                                    SpinnerView()
                                        .frame(width: 40, height: 40)
                                        .frame(maxWidth: .infinity)
                                        .task {
                                            await viewModel.loadNextPage()
                                        }
                                }
                            }
                            .listSectionSeparator(.hidden, edges: [.top, .bottom])
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                    }
                case .failure:
                    ErrorView {
                        await viewModel.fetchData()
                    }
            }
        }
        .padding(.top, .medium3)
        .taskOnce {
            await viewModel.fetchData()
        }
    }
}
