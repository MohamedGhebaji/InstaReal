// Copyright © InstaReal. All rights reserved.

import SwiftUI

import DesignSystem
import Utils
import NukeUI

public struct PostDetailView: View {
    
    @StateObject private var viewModel: PostDetailViewModel
    
    public init(postId: UUID) {
        _viewModel = StateObject(wrappedValue: PostDetailViewModel(postId: postId))
    }
    
    public var body: some View {
        GeometryReader { proxy in
            Group {
                switch viewModel.postState {
                    case .loading:
                        SpinnerView()
                            .frame(width: 30, height: 30)
                    case .success(let post):
                        ScrollView(showsIndicators: false) {
                            IRVStack(alignment: .leading, spacing: .large1) {
                                LazyImage(url: URL(string: post.imageUrl)) { state in
                                    if let image = state.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: proxy.size.width, height: proxy.size.width)
                                            .clipShape(RoundedRectangle(cornerRadius: 16))
                                    } else {
                                        Color.gray
                                    }
                                }
                                
                                IRVStack(alignment: .leading, spacing: .medium2) {
                                    ForEach(viewModel.comments) { comment in
                                        CommentView(state: comment)
                                    }
                                }
                                .padding(.horizontal, .medium2)
                            }
                        }
                    case .failure:
                        ErrorView {
                            await viewModel.fetchData()
                        }
                }
            }
            .taskOnce {
                await viewModel.fetchData()
            }
        }
    }
}
