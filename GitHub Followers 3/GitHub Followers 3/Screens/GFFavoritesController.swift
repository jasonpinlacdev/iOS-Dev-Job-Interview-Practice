//
//  GFFavoritesController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/30/21.
//

import UIKit

class GFFavoritesController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  func configure() {
    self.title = "GFFavoritesController"
    self.view.backgroundColor = .systemBackground
    navigationItem.largeTitleDisplayMode = .never
  }
}