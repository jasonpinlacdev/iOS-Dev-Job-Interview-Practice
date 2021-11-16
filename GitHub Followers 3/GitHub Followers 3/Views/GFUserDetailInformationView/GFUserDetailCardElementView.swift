//
//  GFUserDetailCardElementView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

class GFUserDetailCardElementView: UIView {
  
  let user: GFUser
  
  init(user: GFUser) {
    self.user = user
    
    super.init(frame: .zero)
    configure()
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.backgroundColor = .systemRed
    self.layer.cornerRadius = 16
  }
  
  private func configureLayout() {
    
  }

}
