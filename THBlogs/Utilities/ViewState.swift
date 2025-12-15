//
//  ViewState.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import Foundation

enum ViewState<T> {
	case idle
	case loading
	case empty
	case data(T)
	case error(String)
}
