//
//  GFFollowerCollectionViewCell.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/6/21.
//

import UIKit

class GFFollowersCollectionViewCell: UICollectionViewCell {
  
  // REMEMBER: These cells are instantiated implicitly by the collectionView and ready to be used/reused/dequeued sitting in memory.
  // We do not need to worry about manually instantiating any of these.
  
  static let reuseIdentifier: String = String(describing: GFFollowersCollectionViewCell.self)
  
  let followerAvatarImageView = UIImageView(frame: .zero)
  let followerUsernameLabel = UILabel(frame: .zero)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
        self.contentView.backgroundColor = .systemGreen
        configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureLayout() {
    followerAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
    followerUsernameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(followerAvatarImageView)
    self.contentView.addSubview(followerUsernameLabel)
    
    NSLayoutConstraint.activate([
    
    ])
    
  }
  
  func setup(follower: GFFollower) {
//    followerAvatarImageView.image =
//    followerUsernameLabel.text =
  }
  
}
