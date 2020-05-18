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
    var hasMoreFollowers = true
    var followers: [Follower] = []
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        configureDataSource()
        getFollowers(username: username, page: page)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    func getFollowers(username: String, page: Int) {
        NetworkManager.shared.getFollowers(username: username, page: page) { result in
            switch result {
            case let .success(followers):
                if followers.count < 100 { self.hasMoreFollowers = false }
                self.followers.append(contentsOf: followers)
                self.updateData()
            case let .failure(error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    func configureViewController() {
        view.backgroundColor = UIColor.systemBackground
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    func configureCollectionView() {
        
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
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
        collectionView.delegate = self
    }
    
    
    func configureDataSource() {
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
    
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(self.followers, toSection: .main)
        DispatchQueue.main.async { [weak self] in
            self?.dataSource.apply(snapShot, animatingDifferences: true)
        }
    }
    
}

extension FollowersViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffsetY = scrollView.contentOffset.y
        let totalContentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if currentOffsetY + screenHeight > totalContentHeight {
            // This means we scrolled to the bottom of the screen
            guard hasMoreFollowers else { return }
            page += 1
            print("getting page\(page) of followers")
            getFollowers(username: username, page: page)
        }
    }
}
