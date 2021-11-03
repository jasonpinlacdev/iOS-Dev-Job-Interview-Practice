//
//  GFFollowersController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFFollowersController: UIViewController {
  
  let followers: [GFFollower]
  
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
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  private func configure() {
    self.title = "FollowersController"
    self.view.backgroundColor = .systemBackground
    navigationItem.largeTitleDisplayMode = .always
  }
  
  
}
