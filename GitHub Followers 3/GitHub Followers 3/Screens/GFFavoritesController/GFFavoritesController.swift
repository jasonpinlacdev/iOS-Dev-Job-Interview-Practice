//
//  GFFavoritesController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/30/21.
//

import UIKit


class GFFavoritesController: UIViewController {
  
  let tableView = UITableView()
  var favoritesTableViewDiffableDataSource: GFFavoritesTableViewDiffableDataSource!
  let favoriteTableViewDelegate = GFFavoritesTableViewDelegate()
  let emptyStateView = GFFavoritesEmptyStateView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureTableView()
    configureEmptyStateView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    favoritesTableViewDiffableDataSource.applySnapshotOfFavorites(animatingDifferences: false)
    checkForEmptyState()
  }

  
  private func configure() {
    self.title = "Favorite GitHub Users"
    self.view.backgroundColor = .systemBackground
    navigationItem.largeTitleDisplayMode = .never
  }
  
  private func configureTableView() {
    self.tableView.frame = self.view.frame
    self.view.addSubview(tableView)
    self.tableView.register(GFFavoritesTableViewCell.self, forCellReuseIdentifier: GFFavoritesTableViewCell.reuseIdentifier)
    self.tableView.delegate = self.favoriteTableViewDelegate
    favoriteTableViewDelegate.favoritesController = self
    configureTableViewDiffableDataSource()
    favoritesTableViewDiffableDataSource.favoritesController = self
  }
  
  private func configureTableViewDiffableDataSource() {
    self.favoritesTableViewDiffableDataSource = GFFavoritesTableViewDiffableDataSource(tableView: self.tableView, cellProvider: { tableView, indexPath, username in
      guard let cell = tableView.dequeueReusableCell(withIdentifier: "GFFavoritesTableViewCell", for: indexPath) as? GFFavoritesTableViewCell else { fatalError("Failed to dequeue reusable GFFavoritesTableViewCell") }
      cell.set(username: username)
      return cell
    })
    favoritesTableViewDiffableDataSource.applySnapshotOfFavorites(animatingDifferences: false)
  }
  
  private func configureEmptyStateView() {
    self.emptyStateView.frame = self.view.bounds
    self.view.addSubview(self.emptyStateView)
    self.emptyStateView.isHidden = true
  }
  
  func checkForEmptyState() {
    if GFPersistenceManager.shared.isFavoriteUsersEmpty {
      emptyStateView.isHidden = false
      tableView.isHidden = true
    } else {
      emptyStateView.isHidden = true
      tableView.isHidden = false
    }
  }
  
  
  
  
}

