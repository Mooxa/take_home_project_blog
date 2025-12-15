//
//  PostService.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//
import Foundation

protocol PostServiceProtocol {
	func fetchPosts(completion: @escaping (Result<[Post], THBError>) -> Void)
}


final class PostService: PostServiceProtocol {
	func fetchPosts(completion: @escaping (Result<[Post], THBError>) -> Void) {
		let endpoint = Constants.API.baseURL + "/posts"
		
		guard let url = URL(string: endpoint) else {
			completion(.failure(.invalidURL))
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if let error  =  error {
				completion(.failure(.serverError(error.localizedDescription)))
				return
			}
			
			guard let data = data else {
				completion(.failure(.noData))
				return
			}
			
			do {
				let decoder = JSONDecoder()
				decoder.keyDecodingStrategy = .convertFromSnakeCase
				let posts = try decoder.decode([Post].self, from: data)
				completion(.success(posts))
			} catch {
				completion(.failure(.decodingError))
			}
			
		}
		
		task.resume()
	}

	}

final class MockPostService: PostServiceProtocol {
	
	var result: Result<[Post], THBError>
	
	init(result: Result<[Post], THBError>) {
		self.result = result
	}
	
	func fetchPosts(completion: @escaping (Result<[Post], THBError>) -> Void) {
		completion(result)
	}
}
