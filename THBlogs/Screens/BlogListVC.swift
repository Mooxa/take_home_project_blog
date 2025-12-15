//
//  BlogListVC.swift
//  THBlogs
//
//  Created by Mouhamed Dieye on 13/12/2025.
//

import UIKit

class BlogListVC: UIViewController {
	
	let tableView =  UITableView()
	private let viewModel: BlogListVM = BlogListVM()
	private var searching = false
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configureViewController()
		configureSearchController()
		configureTableView()
		bindViewModel()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.setNavigationBarHidden(false, animated: false)
	}
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		viewModel.fetchPosts()
	}
	
	func configureViewController() {
		view.backgroundColor = .systemBackground
		self.title = "Blog"
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func configureSearchController() {
		let searchController = UISearchController()
		searchController.searchResultsUpdater = self
		searchController.searchBar.delegate = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.placeholder = "Rechercher"
		navigationItem.searchController = searchController
	}
	
	func configureTableView() {
		view.addSubview(tableView)
		tableView.frame = view.bounds
		tableView.rowHeight = UITableView.automaticDimension
		tableView.dataSource = self
		tableView.delegate = self
		tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseID)
	}
	
	func bindViewModel() {
		viewModel.onStateChange = { [weak self] state in
			guard let self else { return }
			self.render(state)
		}
	}
	
	private func render(_ state: ViewState<[Post]>) {
		switch state {
			case .idle:
				break
			case .loading:
				DispatchQueue.main.async { [weak self] in
					guard let self = self else { return }
					self.showLoadingView()
				}
				
			case .empty:
				dismissLoadingView()
				DispatchQueue.main.async {self.showEmptyStateView(with: "Pas d'articles pour le moment", in: self.view)}
				
			case .data:
				dismissLoadingView()
				tableView.reloadData()
				
			case .error(let message):
				dismissLoadingView()
				self.showAlert(message: message)
		}
	}
	
}


extension BlogListVC: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return searching ? viewModel.filteredPosts.count : viewModel.numberOfPosts
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseID) as! PostCell
		let post =  searching ? viewModel.filteredPosts[indexPath.row] : viewModel.posts[indexPath.row]
		cell.set(post: post)
		return cell
	}
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let post = viewModel.posts[indexPath.row]
		let destVC = PostDetailVC()
		destVC.post = post
		navigationController?.pushViewController(destVC, animated: true)
	}
}

extension BlogListVC: UISearchResultsUpdating, UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		viewModel.filteredPosts = viewModel.posts.filter({$0.body.lowercased().contains(searchText.lowercased())})
		searching = true
		tableView.reloadData()
	}
	
	func updateSearchResults(for searchController: UISearchController) {
		guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
		viewModel.filteredPosts = viewModel.posts.filter{ $0.body.lowercased().contains(filter.lowercased())}
		
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searching = false
		tableView.reloadData()
	}
}
