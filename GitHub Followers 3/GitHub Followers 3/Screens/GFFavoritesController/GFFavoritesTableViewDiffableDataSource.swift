//
//  GFFavoritesTableViewDiffableDataSource.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/30/21.
//

import UIKit

enum GFFavoritesSection {
  
  case main
  
}

class GFFavoritesTableViewDiffableDataSource: UITableViewDiffableDataSource<GFFavoritesSection, String> {
  
  weak var favoritesController: GFFavoritesController?

  
  func applySnapshotOfFavorites(animatingDifferences: Bool) {
    var initialSnapshot = NSDiffableDataSourceSnapshot<GFFavoritesSection, String>()
    initialSnapshot.appendSections([.main])
    initialSnapshot.appendItems(GFPersistenceManager.shared.getFavoriteUsers, toSection: .main)
    self.apply(initialSnapshot, animatingDifferences: animatingDifferences, completion: nil)
  }
  
  
  override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    guard editingStyle == .delete  else { return }
    let username = GFPersistenceManager.shared.getFavoriteUsers[indexPath.row]
    GFPersistenceManager.shared.removeFromFavorites(username) { [weak self] in
      self?.applySnapshotOfFavorites(animatingDifferences: true)
      self?.favoritesController?.checkForEmptyState()
    }
  }
  
}
