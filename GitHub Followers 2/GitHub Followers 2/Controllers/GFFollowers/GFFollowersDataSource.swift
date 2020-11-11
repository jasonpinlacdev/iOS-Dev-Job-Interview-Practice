//
//  GFFollowersDataSource.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/11/20.
//

import UIKit

enum Section {
    case main
}

class GFFollowersDataSource: UICollectionViewDiffableDataSource<Section, GFFollower> {
    
    func updateDataSource(with followers: [GFFollower]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, GFFollower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers, toSection: .main)
        DispatchQueue.main.async {
            self.apply(snapshot, animatingDifferences: true)
        }
    }

}
