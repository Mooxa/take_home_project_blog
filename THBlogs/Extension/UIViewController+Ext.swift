//
//  UIViewController+Ext.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import UIKit

fileprivate var containerView: UIView!

extension UIViewController {
	func showLoadingView() {
		containerView = UIView(frame: view.bounds)
		view.addSubview(containerView)
		containerView.backgroundColor = .systemBackground
		containerView.alpha = 0
		UIView.animate(withDuration: 0.25) {
			containerView.alpha = 0.8
		}
		let activityIndicatorView = UIActivityIndicatorView(style: .large)
		containerView.addSubview(activityIndicatorView)
		
		activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			activityIndicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			activityIndicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
		activityIndicatorView.startAnimating()
	}
	
	func dismissLoadingView() {
		DispatchQueue.main.async {
			containerView.removeFromSuperview()
			containerView = nil
		}
	}
	
	func showEmptyStateView(with message: String, in view: UIView){
		let emptyStateView = EmptyStateView(message: message)
		emptyStateView.frame = view.bounds
		view.addSubview(emptyStateView)
	}
	
	func showAlert(message: String) {
		let alert = UIAlertController(
			title: "Erreur",
			message: message,
			preferredStyle: .alert
		)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}
