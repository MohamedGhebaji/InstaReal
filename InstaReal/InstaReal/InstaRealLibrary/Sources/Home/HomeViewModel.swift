// Copyright © InstaReal. All rights reserved.

import SwiftUI

import ApiClient
import DesignSystem
import Models
import Utils
import UUIDClient
import DI

@MainActor
final class HomeViewModel: ObservableObject {
    
    // MARK: - Public properties
    
    @Published var storiesState: ViewState<[StoryState]> = .loading
    @Published var postsState: ViewState<[PostState]> = .loading
    @Published var canLoadMore = true

    // MARK: - Private properties
    
    private let apiClient: ApiClient
    private let uuidClient: UUIDClient
    public init(
        apiClient: ApiClient = DIContainer.shared.apiClient,
        uuidClient: UUIDClient = DIContainer.shared.uuidClient
    ) {
        self.apiClient = apiClient
        self.uuidClient = uuidClient
    }
    
    // MARK: - Public functions
    
    func fetchData() async {
        async let stories = apiClient
            .fetch(route: .stories, as: [Story].self)
            .map {
                StoryState(id: $0.id, imageUrl: $0.imageUrl, color: Color.random)
            }
        async let posts = apiClient
            .fetch(route: .posts, as: [Post].self)
            .map { $0.toState(uuidClient: uuidClient) }
        do {
            storiesState = .success(try await stories)
        } catch {
            storiesState = .failure
        }
        do {
            postsState = .success(try await posts)
        } catch {
            postsState = .failure
        }
    }
    
    func loadNextPage() async {
        switch postsState {
            case var .success(posts):
                async let nextPage = apiClient
                    .fetch(route: .posts, as: [Post].self)
                    .map { $0.toState(uuidClient: uuidClient) }
                do {
                    posts.append(contentsOf: try await nextPage)
                    postsState = .success(posts)
                } catch {
                    // TODO: Handle error when paginating fail
                }
            default: break
        }
    }
    
    func didLikePost(_ post: PostState) {
        switch postsState {
            case .success(var posts):
                if let index = posts.firstIndex(of: post) {
                    var post = post
                    post.isLiked.toggle()
                    post.likeCount += post.isLiked ? 1 : -1
                    post.likeCountText = post.likeCount.humanReadableCount
                    posts[index] = post
                    postsState = .success(posts)
                }
            default:
                break
        }
    }
    func didSelectPost(_ post: PostState) {
        switch postsState {
            case .success(var posts):
                if let index = posts.firstIndex(of: post) {
                    var post = post
                    post.isSeen = true
                    posts[index] = post
                    postsState = .success(posts)
                }
            default:
                break
        }
    }
}

extension Post {
    
    func toState(uuidClient: UUIDClient) -> PostState {
        PostState(
            id: uuidClient.uuid(),
            parentId: id,
            imageUrl: imageUrl,
            profilePictureUrl: user.profilePicture,
            username: user.username,
            caption: caption,
            likeCount: likeCount,
            likeCountText: likeCount.humanReadableCount,
            commentCountText: commentCount.humanReadableCount,
            shareCountText: shareCount.humanReadableCount,
            createdAt: createdAt.humanReadable
        )
    }
}
