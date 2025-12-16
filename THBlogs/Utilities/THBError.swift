//
//  THBError.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

enum THBError: Error {
	
	case invalidURL
	case noData
	case decodingError
	case serverError(String)
	
	var message: String {
		switch self {
			case .invalidURL:
				return "invalid URL"
			case .noData:
				return "No data available"
			case .decodingError:
				return "Decoding error"
			case .serverError(let msg):
				return msg
		}
	}
}
