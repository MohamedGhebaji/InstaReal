// Copyright © InstaReal. All rights reserved.

import XCTest

@testable import Home
import Models
import TestUtils

@MainActor
final class HomeViewModelTests: XCTestCase {
    
    // ✅ Mock UUID
    private let testUUID = UUID(uuidString: "550e8400-e29b-41d4-a716-446655440000")!
    
    // ✅ Mock Stories
    private var mockStories: [Story] {
        return [
            Story(id: UUID(), userId: UUID(), imageUrl: "mock_story_1"),
            Story(id: UUID(), userId: UUID(), imageUrl: "mock_story_2")
        ]
    }
    
    // ✅ Mock Comments
    private var mockComments: [Comment] {
        return [
            Comment(id: UUID(), comment: "Superbe photo ! 😍", profilePicture: "mock_user_1"),
            Comment(id: UUID(), comment: "J'adore cet endroit !", profilePicture: "mock_user_2")
        ]
    }
    
    // ✅ Mock Posts with Users & Comments
    private var mockPosts: [Post] {
        return [
            Post(
                id: UUID(),
                user: User(id: UUID(), username: "user1", email: "user1@example.com", profilePicture: "mock_user_1", bio: "Voyageur passionné", followersCount: 100, followingCount: 100),
                comments: mockComments,
                imageUrl: "mock_post_1",
                caption: "Voyage à Paris !",
                location: "Paris, France",
                likeCount: 10,
                commentCount: 2,
                shareCount: 3,
                createdAt: Date()
            ),
            Post(
                id: UUID(),
                user: User(id: UUID(), username: "user2", email: "user2@example.com", profilePicture: "mock_user_2", bio: "Photographe", followersCount: 200, followingCount: 50),
                comments: mockComments,
                imageUrl: "mock_post_2",
                caption: "Coucher de soleil incroyable 🌅",
                location: "Nice, France",
                likeCount: 20,
                commentCount: 3,
                shareCount: 5,
                createdAt: Date()
            )
        ]
    }
    
    private var apiClientSuccessMock: ApiClientMock<[Post]>!
    private var apiClientFailureMock: ApiClientMock<[Post]>!
    private var uuidClientMock: UUIDClientMock!
    
    private var viewModel: HomeViewModel!
    
    override func setUp() {
        super.setUp()
        
        apiClientSuccessMock = ApiClientMock(stubType: .success(mockPosts))
        apiClientFailureMock = ApiClientMock(stubType: .failure(NSError(domain: "", code: 500, userInfo: nil)))
        uuidClientMock = UUIDClientMock(stub: testUUID)
        
        viewModel = HomeViewModel(apiClient: apiClientSuccessMock, uuidClient: uuidClientMock)
    }
    
    // MARK: - ✅ Test ViewState<T> Transitions
    
    func test_initialState_isLoading() {
        XCTAssertEqual(viewModel.postsState, .loading)
        XCTAssertEqual(viewModel.storiesState, .loading)
    }
    
    func test_fetchData_failure_setsViewStateToFailure() async {
        let viewModel = HomeViewModel(apiClient: apiClientFailureMock, uuidClient: uuidClientMock)
        await viewModel.fetchData()
        
        XCTAssertEqual(viewModel.postsState, .failure, "postsState should be .failure on API error")
        XCTAssertEqual(viewModel.storiesState, .failure, "storiesState should be .failure on API error")
    }
}
