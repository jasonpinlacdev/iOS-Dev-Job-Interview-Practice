//
//  FollowersViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/30/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    var username: String!
    var page = 1
    var followers = [Follower]()
    var filteredFollowers = [Follower]()
    var hasMoreFollowers = true
    var isSearching = false
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    var searchController: UISearchController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureSearchController()
        configureCollectionView()
        configureDataSource()
        getFollowers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func getFollowers() {
        showLoadingView()
        NetworkManager.shared.getFollowers(username: username, page: page) { result in
            self.dismissLoadingView()
            
            switch result {
            case let .success(followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                
                if self.followers.count == 0 {
                    self.hasMoreFollowers = false
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: "This user doesn't have any followers. Go follow them!😅", in: self.view)
                    }
                    return
                }
                
                //                self.updateData(on: self.followers)
                DispatchQueue.main.async {
                    self.updateSearchResults(for: self.searchController)
                }
                
            case let .failure(error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    @objc func addButtonTapped(_ sender: UIBarButtonItem) {
        showLoadingView()
        NetworkManager.shared.getUser(username: username) { result in
            self.dismissLoadingView()
            
            switch result {
            case .success(let user):
                
                let follower = Follower(login: user.login, avatarURL: user.avatarURL)
                
                PersistenceManager.updateWith(favorite: follower, actionType: .add) { error in
                    guard let error = error else {
                        self.presentGFAlertOnMainThread(title: "Success!", message: "You've successfully favorited this user!", buttonTitle: "Dismiss")
                        return
                    }
                    self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Dismiss")
                }
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    // MARK: - Private Section -
    
    private func configureViewController() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(_:)))
    }
    
    
    private func configureCollectionView() {
        let threeColumnflowLayout: UICollectionViewFlowLayout = {
            let totalWidth = view.bounds.width
            let padding: CGFloat = 12.0
            let minimumItemSpacing: CGFloat = 10.0
            let availableWidth = totalWidth - (2 * padding) - (2 * minimumItemSpacing)
            let itemWidth = availableWidth / 3.0
            
            let flowLayout = UICollectionViewFlowLayout()
            flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
            
            return flowLayout
        }()
        
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: threeColumnflowLayout)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
        collectionView.delegate = self
    }
    
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
            cell.usernameLabel.text = follower.login
            NetworkManager.shared.getAvatarImage(from: follower.avatarURL) { image in
                DispatchQueue.main.async {
                    cell.avatarImageView.image = image
                }
            }
            return cell
        })
    }
    
    
    private func updateData(on followers: [Follower]) {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(followers, toSection: .main)
        DispatchQueue.main.async {
            self.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
    
    
    private func configureSearchController() {
        searchController = UISearchController()
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search for a username"
        searchController.searchBar.isHidden = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}


extension FollowersViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard hasMoreFollowers else { return }
        
        let currentOffsetY = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if currentOffsetY > totalContentHeight - screenHeight {
            // This means we scrolled to the bottom of the screen
            page += 1
            getFollowers()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let followerTapped = isSearching ? filteredFollowers[indexPath.item] : followers[indexPath.item]
        let userInfoViewController = UserInfoViewController()
        userInfoViewController.username = followerTapped.login
        userInfoViewController.delegate = self
        let userInfoNavigationController = UINavigationController(rootViewController: userInfoViewController)
        present(userInfoNavigationController, animated: true)
    }
}


extension FollowersViewController: UISearchResultsUpdating, UISearchBarDelegate {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let filterText = searchController.searchBar.text, !filterText.isEmpty else {
            isSearching = false
            filteredFollowers.removeAll()
            updateData(on: self.followers)
            return
        }
        isSearching = true
        filteredFollowers = followers.filter { return $0.login.lowercased().contains(filterText.lowercased()) }
        updateData(on: filteredFollowers)
    }
    
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        filteredFollowers.removeAll()
        updateData(on: followers)
    }
}


extension FollowersViewController: UserInfoViewControllerDelegate {
    
    func didRequestFollowers(for username: String) {
        // get followers for that user
        title = username
        self.username = username
        page = 1
        followers.removeAll()
        filteredFollowers.removeAll()
        hasMoreFollowers = true
        isSearching = false
        
        searchController.searchBar.text = ""
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .top, animated: true)
        
        getFollowers()
    }
}
