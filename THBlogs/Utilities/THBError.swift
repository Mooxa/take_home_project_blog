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
				return "URL invalide"
			case .noData:
				return "Aucune donnée reçue"
			case .decodingError:
				return "Erreur de décodage"
			case .serverError(let msg):
				return msg
		}
	}
}
