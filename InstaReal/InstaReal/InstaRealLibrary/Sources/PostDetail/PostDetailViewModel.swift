// Copyright © InstaReal. All rights reserved.

import Foundation

import ApiClient
import DI
import Models
import Utils
import DesignSystem

@MainActor
final class PostDetailViewModel: ObservableObject {
    
    @Published var postState: ViewState<Post> = .loading
    @Published var comments: [CommentState] = []
    
    // MARK: - Private properties
    
    private let postId: UUID
    private let apiClient: ApiClient
    public init(
        postId: UUID,
        apiClient: ApiClient = DIContainer.shared.apiClient
    ) {
        self.postId = postId
        self.apiClient = apiClient
    }
    
    func fetchData() async {
        do {
            let post = try await apiClient.fetch(route: .post(id: postId), as: [Post].self)
                .first(where: { $0.id == postId })
            if let post {
                postState = .success(post)
                comments = post.comments.map {
                    .init(id: $0.id, text: $0.comment, profilePictureUrl: $0.profilePicture)
                }
            } else {
                postState = .failure
            }
        } catch {
            postState = .failure
        }
    }
}
