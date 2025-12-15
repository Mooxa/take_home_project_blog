//
//  PostCell.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import UIKit

class PostCell: UITableViewCell {
	
	static let reuseID = "PostCell"
	let titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .label
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
		label.numberOfLines = 0
		label.minimumScaleFactor = 0.75
		label.lineBreakMode = .byWordWrapping
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		configureUI()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func set(post: Post) {
		titleLabel.text = post.title
		bodyLabel.text = post.body
	}
	
	private func configureUI() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(bodyLabel)
		
		let padding: CGFloat = 12
		
		NSLayoutConstraint.activate([
			titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			titleLabel.bottomAnchor.constraint(equalTo: bodyLabel.topAnchor, constant: -padding),
			bodyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			bodyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			bodyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
		])
		
		titleLabel.setContentHuggingPriority(.required, for: .vertical)
		bodyLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
	}
}
