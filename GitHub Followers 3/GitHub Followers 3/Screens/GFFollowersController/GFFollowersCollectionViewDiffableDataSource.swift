//
//  GFFollowersCollectionViewDiffableDataSource.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/4/21.
//

import UIKit

enum GFFollowersSection {
  case main
}

class GFFollowersCollectionViewDiffableDataSource: UICollectionViewDiffableDataSource<GFFollowersSection, GFFollower> {
  
  func setupInitialSnapshot(with followers: [GFFollower]) {
    var initialSnapshot = NSDiffableDataSourceSnapshot<GFFollowersSection, GFFollower>()
    initialSnapshot.appendSections([.main])
    initialSnapshot.appendItems(followers, toSection: .main)
    self.apply(initialSnapshot, animatingDifferences: false)
  }
  
  func applySnapshotUpdate(withMore followers: [GFFollower]) {
    
  }
  
  
}
