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
  
  func applySnapshotUpdate(with followers: [GFFollower], completionHandler: (() -> Void)? = nil) {
    var snapshot = NSDiffableDataSourceSnapshot<GFFollowersSection, GFFollower>()
    snapshot.appendSections([.main])
    snapshot.appendItems(followers, toSection: .main)
    self.apply(snapshot, animatingDifferences: true, completion: completionHandler)
  }
  
  
}
