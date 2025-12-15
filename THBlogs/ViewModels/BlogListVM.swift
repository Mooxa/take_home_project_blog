//
//  BlogListVM.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import Foundation


final class BlogListVM {
	private let service: PostServiceProtocol
	var posts: [Post] = []
	var filteredPosts: [Post] = []
	
	
	var numberOfPosts: Int {
		posts.count
	}
	
	private(set) var state: ViewState<[Post]> = .idle {
		didSet {
			onStateChange?(state)
		}
	}
	
	var onStateChange: ((ViewState<[Post]>) -> Void)?
	
	init(service: PostServiceProtocol = PostService()) {
		self.service = service
	}
	
	func fetchPosts() {
		state = .loading
		service.fetchPosts { [weak self] result in
			DispatchQueue.main.async {
				guard let self else { return }
				switch result {
					case .success(let posts):
						self.posts = posts
						self.state = posts.isEmpty ? .empty : .data(posts)
					case .failure(let error):
						self.state = .error(error.message)
						print("Error fetching posts: \(error)")
				}
			}
		}
	}
	
}
