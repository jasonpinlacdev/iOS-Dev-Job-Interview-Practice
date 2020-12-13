//
//  GFFavoritesDataSource.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 12/10/20.
//

import UIKit

enum FavoritesSection {
    case main
}

class GFFavoritesDataSource: UITableViewDiffableDataSource<FavoritesSection, GFUser> {
    
    var favoritesController: GFFavoritesController?
    
    init(tableView: UITableView, favoritesController: GFFavoritesController, cellProvider: @escaping UITableViewDiffableDataSource<FavoritesSection, GFUser>.CellProvider) {
        self.favoritesController = favoritesController
        super.init(tableView: tableView, cellProvider: cellProvider)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let favoritedUser = itemIdentifier(for: indexPath) {
                GFPersistenceManager.shared.updateFavoritesWith(user: favoritedUser, typeOfUpdate: .remove) { error in
                    if let error = error {
                        favoritesController?.presentAlert(alertTitle: "Something went wrong", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                    } else {
                        if let favoritesController = favoritesController {
                            favoritesController.getFavorites()
                            if favoritesController.favorites.isEmpty {
                                favoritesController.view.bringSubviewToFront(favoritesController.emptyStateView)
                            } else {
                                favoritesController.view.bringSubviewToFront(favoritesController.tableView)
                                favoritesController.updateDatasource(with: favoritesController.favorites, animatingDifferences: true)
                            }
                        }
                    }
                }
            }
        }
    }
    
    
}
