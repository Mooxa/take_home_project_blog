//
//  EmptyStateView.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 15/12/2025.
//

import UIKit

class EmptyStateView: UIView {
	
	let logoImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.tintColor = .label
		return imageView
	}()
	
	let messageLabel: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.textColor = .label
		label.numberOfLines = 0
		label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
		label.adjustsFontSizeToFitWidth = true
		label.minimumScaleFactor = 0.9
		label.lineBreakMode = .byTruncatingTail
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(message: String) {
		super.init(frame: .zero)
		messageLabel.text = message
		configure()
	}
	
	private func configure() {
		addSubview(messageLabel)
		addSubview(logoImageView)
		
		messageLabel.numberOfLines = 3
		messageLabel.textColor = .secondaryLabel
		
		logoImageView.image = UIImage(systemName: "tray")
		

		NSLayoutConstraint.activate([
			
			logoImageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
			logoImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor, constant: -30),
			logoImageView.widthAnchor.constraint(equalToConstant: 100),
			logoImageView.heightAnchor.constraint(equalToConstant: 100),
			messageLabel.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 20),
			messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			
		])
		
	}
}

