//
//  BlogListVMTests.swift
//  THBlogsTests
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import XCTest
@testable import THBlogs

final class BlogListVMTests: XCTestCase {
	private var viewModel: BlogListVM!

	func testFetchPostSuccessStateWithData() {
		
		// GIVEN
		let posts = [
			Post(userId: 10, id: 1, title: "Post 1", body: "Body")
		]
		
		let service = MockPostService(result: .success(posts))
		viewModel = BlogListVM(service: service)
		
		let expectation = expectation(description: "Data state emitted")
		
		// WHEN
		viewModel.onStateChange = { state in
			if case .data(let result) = state {
				XCTAssertEqual(result.count, 1)
				XCTAssertEqual(result.first?.title, "Post 1")
				XCTAssertEqual(self.viewModel.posts.count, 1)
				expectation.fulfill()
			}
		}
		
		viewModel.fetchPosts()
		
		// THEN
		
		waitForExpectations(timeout: 1)
	}
	
	func testFetchPostsEmptyState() {
		
		let service = MockPostService(result: .success([]))
		viewModel = BlogListVM(service: service)
		
		let expectation = expectation(description: "Empty state emitted")
		
		viewModel.onStateChange = { state in
			if case .empty = state {
				XCTAssertTrue(self.viewModel.posts.isEmpty)
				expectation.fulfill()
			}
		}
		
		viewModel.fetchPosts()
		
		waitForExpectations(timeout: 1)
	}

	func testFetchPostsLoadingStateFirst() {
		
		let service = MockPostService(result: .success([]))
		viewModel = BlogListVM(service: service)
		
		let expectation = expectation(description: "Loading state")
		
		viewModel.onStateChange = { state in
			if case .loading = state {
				expectation.fulfill()
			}
		}
		
		viewModel.fetchPosts()
		
		waitForExpectations(timeout: 1)
	}

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
