//
//  UIViewController+Ext.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import UIKit

fileprivate var containerView: UIView?

extension UIViewController {
	
	func showLoadingView() {
		guard containerView == nil else { return }
		
		let container = UIView(frame: view.bounds)
		container.backgroundColor = .systemBackground
		container.alpha = 0
		container.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(container)
		containerView = container
		
		UIView.animate(withDuration: 0.25) {
			container.alpha = 0.8
		}
		
		let activityIndicator = UIActivityIndicatorView(style: .large)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		container.addSubview(activityIndicator)
		activityIndicator.startAnimating()
		
		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
		])
		
		NSLayoutConstraint.activate([
			container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			container.topAnchor.constraint(equalTo: view.topAnchor),
			container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func dismissLoadingView() {
		guard let containerView = containerView else { return }
		UIView.animate(withDuration: 0.25, animations: {
			containerView.alpha = 0
		}) { _ in
			containerView.removeFromSuperview()
		}
	}
	
	func showEmptyStateView(with message: String, in view: UIView){
		let emptyStateView = EmptyStateView(message: message)
		emptyStateView.frame = view.bounds
		view.addSubview(emptyStateView)
	}
	
	func showAlert(message: String) {
		let alert = UIAlertController(
			title: "Error",
			message: message,
			preferredStyle: .alert
		)
		alert.addAction(UIAlertAction(title: "OK", style: .default))
		present(alert, animated: true)
	}
}
