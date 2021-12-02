//
//  GFAlertViewContainer.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFAlertContainerView: UIView {
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.backgroundColor = .systemBackground
    self.layer.cornerRadius = 24
    self.clipsToBounds = true
    self.layer.borderWidth = 2.0
    self.layer.borderColor = UIColor.systemGray3.cgColor
  }
  
}
