//
//  GFFavoritesController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFFavoritesController: UIViewController {
    
    var favorites: [GFUser] = []
    
    lazy var tableView = UITableView(frame: view.bounds, style: .plain)
    lazy var emptyStateView = GFEmptyStateView(frame: view.bounds, message: "You don't have any users favorited.")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = true
        GFPersistenceManager.shared.retrieveFavorites { [weak self] result in
            switch result {
            case .success(let favorites):
                self?.favorites = favorites
            case .failure:
                break
            }
        }
        if favorites.isEmpty {
            tableView.removeFromSuperview()
            view.addSubview(GFEmptyStateView(frame: view.bounds, message: "You don't have any users favorited."))
        } else {
            emptyStateView.removeFromSuperview()
            view.addSubview(tableView)
        }
        tableView.reloadData()
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        GFPersistenceManager.shared.retrieveFavorites { [weak self] result in
            switch result {
            case .success(let favorites):
                self?.favorites = favorites
            case .failure:
                break
            }
        }
        if favorites.isEmpty {
            view.addSubview(GFEmptyStateView(frame: view.bounds, message: "You don't have any users favorited."))
        } else {
            tableView.register(GFFavoritesCell.self, forCellReuseIdentifier: GFFavoritesCell.reuseIdentifier)
            tableView.delegate = self
            tableView.dataSource = self
            tableView.rowHeight = 95
            tableView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(tableView)
        }
    }
    
}

extension GFFavoritesController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        selectedCell?.setSelected(false, animated: true)
        let userInfoController = GFUserInfoController(user: favorites[indexPath.row])
        userInfoController.delegate = self
        navigationController?.pushViewController(userInfoController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            GFPersistenceManager.shared.updateFavoritesWith(user: favorites[indexPath.row], typeOfUpdate: .remove) { error in
                if let error = error {
                    presentAlert(alertTitle: "Something went wrong", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                } else {
                    GFPersistenceManager.shared.retrieveFavorites { [weak self] result in
                        switch result {
                        case .success(let favorites):
                            self?.favorites = favorites
                        case .failure:
                            break
                        }
                    }
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        }
    }
    
}

extension GFFavoritesController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let favoritesCell = tableView.dequeueReusableCell(withIdentifier: GFFavoritesCell.reuseIdentifier, for: indexPath) as? GFFavoritesCell else {
            fatalError("Failed to dequeue reusable GFFavoritesCell")
        }
        favoritesCell.setFavorite(user: favorites[indexPath.row])
        return favoritesCell
    }
}

extension GFFavoritesController: GFUserInfoControllerDelegate {
    func getFollowersTapped(username: String, followers: [GFFollower]) {
        navigationController?.pushViewController(GFFollowersController(username: username, followers: followers), animated: true)
    }
}
