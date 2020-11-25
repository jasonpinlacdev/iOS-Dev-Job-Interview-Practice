//
//  GFFollowersController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFFollowersController: UIViewController {
    
    var username: String
    var followers: [GFFollower]
    var filteredFollowers: [GFFollower]!
    
    var hasMoreFollowers = true
    var nextPageOfFollowersToGet = 2
    
    var collectionView: UICollectionView!
    var diffableDatasource: GFFollowersDataSource!
    lazy var delegateFlowLayout = GFFollowersDelegateFlowLayout(viewController: self)
    
    init(username: String, followers: [GFFollower]) {
        self.username = username
        self.followers = followers
        super.init(nibName: nil, bundle: nil)
        if followers.count < 100 {
            hasMoreFollowers = false
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = username
        if followers.isEmpty {
            view.addSubview(GFEmptyStateView(frame: self.view.frame, message: "This user doesn't have any followers. Go follow them."))
        } else {
            configureSearchController()
            configureCollectionView()
            configureDiffableDatasource()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = delegateFlowLayout
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseIdentifier)
        view.addSubview(collectionView)
    }
    
    private func configureDiffableDatasource() {
        diffableDatasource = GFFollowersDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseIdentifier, for: indexPath) as? GFFollowerCell else {
                fatalError("Failed to dequeue reusable GFFollowerCell")
            }
            cell.set(follower: follower)
            return cell
        })
        diffableDatasource.updateDataSource(with: followers)
    }
    
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username..."
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
}


extension GFFollowersController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text, !searchText.isEmpty else {
            diffableDatasource.updateDataSource(with: followers)
            return
        }
        filteredFollowers = followers.filter { follower in
            return follower.login.lowercased().contains(searchText.lowercased())
        }
        diffableDatasource.updateDataSource(with: filteredFollowers)
    }
}

extension GFFollowersController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        diffableDatasource.updateDataSource(with: followers)
    }
}


extension GFFollowersController: GFUserInfoControllerDelegate {
    func getFollowersTapped(username: String, followers: [GFFollower]) {
        navigationController?.pushViewController(GFFollowersController(username: username, followers: followers), animated: true)
    }
}

