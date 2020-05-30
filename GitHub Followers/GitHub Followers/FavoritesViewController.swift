//
//  FavoritesViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    var favorites = [Follower]()

    let tableView = UITableView()
    let cellReuseID = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableViewController()
        
        favorites.append(Follower(login: "jasontest", avatarURL: "jasontesturl"))
        
    }
    
    
    // MARK: - Private Section -
    
  
    private func configureTableViewController() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseID)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.frame = view.bounds
        view.addSubview(tableView)
    }
    
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        containerView.addSubview(childViewController.view)
        self.addChild(childViewController)
        childViewController.didMove(toParent: self)
        childViewController.view.frame = containerView.bounds
    }
    
}

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension FavoritesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favorites.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath)
        cell.textLabel?.text = favorites[indexPath.row].login
        return cell
    }
}
