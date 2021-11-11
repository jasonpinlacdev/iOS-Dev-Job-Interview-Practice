//
//  GFFollowersController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFFollowersController: UIViewController {
  
  let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  lazy var collectionViewDelegateFlowLayout = GFFollowersCollectionViewDelegateFlowLayout(numberOfItemsPerRow: 3, spacingBetweenItems: 10, followersController: self)
  var collectionViewDiffableDataSource: GFFollowersCollectionViewDiffableDataSource!
  
  let username: String
  var followersOfCurrentPage: [GFFollower]
  var allFollowersSoFar: [GFFollower]
  var currentPageOfFollowers = 1
  
  var searchedFollowers = [GFFollower]()
  
  var hasMoreFollowers: Bool {
    followersOfCurrentPage.count < 100 ? false : true
  }
  
  
  init(username: String, followers: [GFFollower]) {
    self.username = username
    self.followersOfCurrentPage = followers
    self.allFollowersSoFar = followers
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureSearchController()
    if self.followersOfCurrentPage.isEmpty {
      let followersEmptyStateView = GFFollowersEmptyStateView()
      followersEmptyStateView.translatesAutoresizingMaskIntoConstraints = false
      view.addSubview(followersEmptyStateView)
      NSLayoutConstraint.activate([
        followersEmptyStateView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        followersEmptyStateView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        followersEmptyStateView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
        followersEmptyStateView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
      ])
    } else {
      configureCollectionViewLayout()
      configureCollectionView()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configure() {
    self.title = "\(username)'s Followers"
    navigationItem.largeTitleDisplayMode = .always
    self.view.backgroundColor = .systemBackground
  }
  
  private func configureSearchController() {
    let searchController = UISearchController()
    searchController.searchBar.placeholder = "Search a username"
    searchController.obscuresBackgroundDuringPresentation = false
    self.navigationItem.searchController = searchController
    self.navigationItem.hidesSearchBarWhenScrolling = false
    searchController.searchResultsUpdater = self
  }
  
  private func configureCollectionViewLayout() {
    self.collectionView.translatesAutoresizingMaskIntoConstraints = false
    self.view.addSubview(self.collectionView)
    
    NSLayoutConstraint.activate([
      self.collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      self.collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
      self.collectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95),
      self.collectionView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.95),
    ])
  }
  
  private func configureCollectionView() {
    self.collectionView.register(GFFollowersCollectionViewCell.self, forCellWithReuseIdentifier: GFFollowersCollectionViewCell.reuseIdentifier)
    self.collectionView.delegate = self.collectionViewDelegateFlowLayout
    self.collectionView.dataSource = self.collectionViewDiffableDataSource
    configureCollectionViewDiffableDataSource()
  }
  
  private func configureCollectionViewDiffableDataSource() {
    self.collectionViewDiffableDataSource = GFFollowersCollectionViewDiffableDataSource(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, follower in
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowersCollectionViewCell.reuseIdentifier, for: indexPath) as? GFFollowersCollectionViewCell else { fatalError("Failed to dequeue a GFFollowerCollectionViewCell.")}
      cell.setup(follower: follower)
      return cell
    })
    self.collectionViewDiffableDataSource.setupInitialSnapshot(with: self.allFollowersSoFar)
  }
  
}


extension GFFollowersController: UISearchResultsUpdating {
  
  func updateSearchResults(for searchController: UISearchController) {
    guard let searchText = searchController.searchBar.text?.lowercased(), !searchText.isEmpty else {
      self.collectionViewDiffableDataSource.applySnapshotUpdate(with: self.allFollowersSoFar, completionHandler: nil)
      return
    }
   
    self.searchedFollowers = allFollowersSoFar.filter({ follower in
      let followerUsername = follower.login.lowercased()
      return followerUsername.contains(searchText)
    })
    
    self.collectionViewDiffableDataSource.applySnapshotUpdate(with: searchedFollowers, completionHandler: nil)
  }
  

}

