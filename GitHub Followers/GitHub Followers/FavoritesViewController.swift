//
//  FavoritesViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    let tableView = UITableView()
    var favorites = [Follower]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getFavorites()
    }
    
    
    // MARK: - Private Section -
    
    private func getFavorites() {
        PersistenceManager.retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                guard !favorites.isEmpty else { self.showEmptyStateView(with: "There are no users favorited.", in: self.view); return}
                self.favorites = favorites
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    private func configureTableViewController() {
        view.addSubview(tableView)
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GFFavoriteTableViewCell.self, forCellReuseIdentifier: GFFavoriteTableViewCell.reuseID)
        
    }
    
}


extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let followersViewController = FollowersViewController(username: favorites[indexPath.row].login)
        navigationController?.pushViewController(followersViewController, animated: true)
    }
}


extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GFFavoriteTableViewCell.reuseID, for: indexPath) as? GFFavoriteTableViewCell else {
            fatalError("Favorite Cell failed to dequeue for reuse.")
        }
        let favorite = favorites[indexPath.row]
        cell.set(favorite: favorite)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let favoriteToRemove = favorites[indexPath.row]
            favorites.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            PersistenceManager.updateWith(favorite: favoriteToRemove, actionType: .remove) { error in
                if let error = error {
                    self.presentGFAlertOnMainThread(title: "Failed to Remove", message: error.rawValue, buttonTitle: "Dismiss")
                }
            }
        }
    }
    
}
