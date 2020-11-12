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
    
    var hasMoreFollowers = true
    var nextPageOfFollowersToGet = 2
    
    var collectionView: UICollectionView!
    var diffableDatasource: GFFollowersDataSource!
    lazy var delegate = GFFollowersDelegate(viewController: self)
    
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
        configureCollectionView()
        configureDiffableDatasource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func configureCollectionView() {
        title = username
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = delegate
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
    
}


