//
//  GFAlerContainerView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFAlerContainerView: UIView {
  
  init() {
    super.init(frame: .zero)
    self.backgroundColor = .systemBackground
    self.layer.cornerRadius = 16
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.systemGray.cgColor
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
