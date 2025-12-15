//
//  Post.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 13/12/2025.
//

import Foundation

struct Post: Decodable {
	var userId: Int
	var id: Int
	var title: String
	var body: String
}
