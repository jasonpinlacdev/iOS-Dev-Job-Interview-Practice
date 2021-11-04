//
//  GFFollowersController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFFollowersController: UIViewController {
  
  let followers: [GFFollower]
  let currentPage = 1
  
  let collectionView = UICollectionView()
  // collectionView, dataSource, layout(flow or compositional), custom reusable cell
  
  init(followers: [GFFollower]) {
    self.followers = followers
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  

  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configure() {
    self.title = "FollowersController"
    navigationItem.largeTitleDisplayMode = .always
    self.view.backgroundColor = .systemBackground
  }
  
  private func configureLayout() {
    view.addSubview(collectionView)
  }
  
  private func configureCollectionView() {
    self.collectionView.dataSource = UICollectionViewDiffableDataSource<<#SectionIdentifierType: Hashable#>, ItemIdentifierType>(collectionView: self.collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
      <#code#>
    })
  }
  
  
  
  
  
}
