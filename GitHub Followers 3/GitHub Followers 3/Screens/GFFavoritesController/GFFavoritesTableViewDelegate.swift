//
//  GFFavoritesTableViewDelegate.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/30/21.
//

import UIKit

class GFFavoritesTableViewDelegate: NSObject {
  
  weak var favoritesController: GFFavoritesController?
  
}

extension GFFavoritesTableViewDelegate: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100.0
  }

  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    guard let favoritesController = self.favoritesController else { return }
    guard !favoritesController.isEditing else { return }

    guard let favoritesDiffableDataSource = tableView.dataSource as? GFFavoritesTableViewDiffableDataSource else { return }
    guard let username = favoritesDiffableDataSource.itemIdentifier(for: indexPath) else { return }
    favoritesController.showLoadingView()
    GFNetworkManager.shared.getFollowers(for: username) { result in
      DispatchQueue.main.async {
        favoritesController.removeLoadingView()
        switch result {
        case .success(let followers):
          let followersController = GFFollowersController(username: username, followers: followers)
          favoritesController.navigationController?.pushViewController(followersController, animated: true)
        case .failure(let error):
          favoritesController.presentGFAlertController(alertTitle: error.errorTitle, alertMessage: error.errorMessageDescription, alertButtonText: "Dismiss")
        }
      }
    }
  }
  
}
