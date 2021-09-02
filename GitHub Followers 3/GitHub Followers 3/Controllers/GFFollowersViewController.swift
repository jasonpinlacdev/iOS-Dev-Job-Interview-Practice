//
//  GFFollowersViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFFollowersViewController: UIViewController {
  
  var username: String
  var followersData: String
  
  init(username: String, followersData: String) {
    self.username = username
    self.followersData = followersData
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
    print(followersData)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: false)
  }
  
  private func configure() {
    title = "\(username)'s Followers"
  }
  
  private func configureLayout() {
    view.backgroundColor = .systemBackground
    navigationItem.largeTitleDisplayMode = .always
  }
  
}
