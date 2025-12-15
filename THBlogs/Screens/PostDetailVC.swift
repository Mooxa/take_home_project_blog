//
//  PostDetailVC.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import UIKit

class PostDetailVC: UIViewController {
	
	var post: Post!
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont.preferredFont(forTextStyle: .title1)
		label.textColor = .label
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.9
		label.numberOfLines = 0
		label.lineBreakMode = .byTruncatingTail
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	let bodyLabel: UILabel = {
		let label = UILabel()
		label.textColor = .secondaryLabel
		label.font = UIFont.preferredFont(forTextStyle: .body)
		label.adjustsFontSizeToFitWidth = true
		label.numberOfLines = 0
		label.minimumScaleFactor = 0.75
		label.lineBreakMode = .byWordWrapping
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewController()
		configureUI()
		set(post: post)
	}
	
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
	}
	
	private func configureViewController() {
		view.backgroundColor = .systemBackground
	}
	
	private func set(post: Post) {
		titleLabel.text = post.title
		bodyLabel.text = post.body
	}
	
	private func configureUI() {
		view.addSubview(titleLabel)
		view.addSubview(bodyLabel)
		
		let padding: CGFloat = 12
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
			titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
			bodyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			bodyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
		])
		
		titleLabel.setContentHuggingPriority(.required, for: .vertical)
		bodyLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
	}
	
}

