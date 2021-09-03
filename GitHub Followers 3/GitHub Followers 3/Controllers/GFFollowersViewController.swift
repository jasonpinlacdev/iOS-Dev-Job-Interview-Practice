//
//  GFFollowersViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFFollowersViewController: UIViewController {
  
  var username: String
  var followers: [GFFollower]
  
  init(username: String, followers: [GFFollower]) {
    self.username = username
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
    print(followers.count)
    followers.forEach { follower  in
      print(follower)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configure() {
    title = "\(username)'s Followers"
  }
  
  private func configureLayout() {
    view.backgroundColor = .systemBackground
    navigationItem.largeTitleDisplayMode = .always
  }
  
}
