//
//  GFUserDetailInfoView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/13/21.
//

import UIKit

class GFUserDetailInfoView: UIView {
  
  
//  let avatarImageView: UIImageView
//  let usernameTileLabel: GFTitleLabel
//  let locationPinImageView: UIImageView
//  let locationLabel: UILabel
//  let bioTextView: UITextView

  
  
  init(username: String, realName: String?, location: String?, bio: String?) {
    super.init(frame: .zero)
    configure()
//    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.backgroundColor = .systemYellow
    self.layer.cornerRadius = 16
    translatesAutoresizingMaskIntoConstraints = false
//    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
  }
  
  
  private func configureLayout() {
    
//    self.addSubview(avatarImageView)
//    self.addSubview(usernameTileLabel)
//    self.addSubview(locationPinImageView)
//    self.addSubview(locationLabel)
//    self.addSubview(bioTextView)
    
  }
  
  
}
