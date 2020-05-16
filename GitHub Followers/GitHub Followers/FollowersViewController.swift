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
    var followers: [Follower] = []
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureCollectionView()
        configureDataSource()
        getFollowers()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    func getFollowers() {
        NetworkManager.shared.getFollowers(username: username, page: 1) { result in
            switch result {
            case let .success(followers):
                self.followers = followers
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
        collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: configureFlowLayout())
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
    }
    
    func configureFlowLayout() -> UICollectionViewFlowLayout {
        let totalWidth = self.view.bounds.width
        let padding: CGFloat = 12.0
        let minimumItemSpacing: CGFloat = 10.0
        let availableWidth = totalWidth - (2 * padding) - (2 * minimumItemSpacing)
        let itemWidth = availableWidth / 3.0
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
    
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
            cell.set(follower: follower)
            return cell
        })
    }
    
    func updateData() {
        var snapShot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapShot.appendSections([.main])
        snapShot.appendItems(self.followers)
        dataSource.apply(snapShot, animatingDifferences: true)
    }
    
}


/*
// Collection View without Diffable Data Source
 
// code needed
var followers = [Follower]()
 
 
 
 collectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
 view.addSubview(collectionView)
 
 self.collectionView.dataSource = self
 self.collectionView.delegate = self
 collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseID)
 
 
 
 

extension FollowersViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.followers.count
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseID, for: indexPath) as! GFFollowerCell
        cell.set(follower: followers[indexPath.item])
        return cell
    }
}

extension FollowersViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}

extension FollowersViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalWidth = self.view.bounds.width
        let padding: CGFloat = 12.0
        let minimumItemSpacing: CGFloat = 10.0
        let availableWidth = totalWidth - (2 * padding) - (2 * minimumItemSpacing)
        let itemWidth = availableWidth / 3.0
        return CGSize(width: itemWidth, height: itemWidth + 40)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}
 */
