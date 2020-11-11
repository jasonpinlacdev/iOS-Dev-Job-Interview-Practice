//
//  GFFollowersController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFFollowersController: UIViewController {
    
    enum GFFollowersSection {
        case main
    }
    
    var username: String
    var followers: [GFFollower]
    
    var collectionView: UICollectionView! = nil
    var diffableDatasource: UICollectionViewDiffableDataSource<GFFollowersSection, GFFollower>!
    
    init(username: String, followers: [GFFollower]) {
        self.username = username
        self.followers = followers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(followers)
        
        configureCollectionView()
        configureDiffableDatasource()
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.delegate = self
        collectionView.register(GFFollowerCell.self, forCellWithReuseIdentifier: GFFollowerCell.reuseIdentifier)
        
    }
    
    private func configureDiffableDatasource() {
        diffableDatasource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { [weak self] (collectionView, indexPath, follower) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GFFollowerCell.reuseIdentifier, for: indexPath) as? GFFollowerCell else {
                fatalError("Failed to dequeue reusable GFFollowerCell")
            }
            cell.set(follower: follower)
            return cell
        })
        
        var initialSnapshot = NSDiffableDataSourceSnapshot<GFFollowersSection, GFFollower>()
        initialSnapshot.appendSections([.main])
        initialSnapshot.appendItems(followers, toSection: .main)
        diffableDatasource.apply(initialSnapshot)
    }
    
    private func layoutUI() {
        view.backgroundColor = .systemBackground
        title = username
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
}


extension GFFollowersController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let cellItemWidth = UIScreen.main.bounds.width/3.5
        let cellItemHeight = cellItemWidth * 1.25
        
        return CGSize(width: cellItemWidth, height: cellItemHeight)
    }

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 5.0
//    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
}



