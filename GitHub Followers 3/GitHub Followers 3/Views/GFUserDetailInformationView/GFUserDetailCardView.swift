//
//  GFUserDetailCardView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

class GFUserDetailCardView: UIView {
  
  let user: GFUser
  
  let leftDetailCardElementView: GFUserDetailCardElementView
  let rightDetailCardElementView: GFUserDetailCardElementView

  init(user: GFUser) {
    self.user = user
    leftDetailCardElementView = GFUserDetailCardElementView(user: user)
    rightDetailCardElementView = GFUserDetailCardElementView(user: user)
    
    super.init(frame: .zero)
    configure()
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.backgroundColor = .systemGray3
    self.layer.cornerRadius = 16
  }
  
  private func configureLayout() {
    
  }

}
