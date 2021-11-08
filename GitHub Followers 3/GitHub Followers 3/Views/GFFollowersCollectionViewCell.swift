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
    configure()
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    followerAvatarImageView.layer.cornerRadius = 10
    followerAvatarImageView.clipsToBounds = true
    followerUsernameLabel.textAlignment = .center
    followerUsernameLabel.lineBreakMode = .byTruncatingTail
    followerUsernameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
  }
  
  private func configureLayout() {
    followerAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
    followerUsernameLabel.translatesAutoresizingMaskIntoConstraints = false
    self.contentView.addSubview(followerAvatarImageView)
    self.contentView.addSubview(followerUsernameLabel)
    
    NSLayoutConstraint.activate([
      followerAvatarImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      followerAvatarImageView.heightAnchor.constraint(equalTo: followerAvatarImageView.widthAnchor),
      followerAvatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
      followerAvatarImageView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      
      followerUsernameLabel.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
      followerUsernameLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
      followerUsernameLabel.topAnchor.constraint(equalTo: followerAvatarImageView.bottomAnchor),
      followerUsernameLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
    ])
    
  }
  
  func setup(follower: GFFollower) {
    self.followerAvatarImageView.image = GFImage.avatarPlaceHolder.image
    self.followerUsernameLabel.text = follower.login
    
    // This network call to download the follower avatar image is extremely inefficient because everytime we dequeue a reusable collection view cell, we will have to make this network call to populate the imageView.
    // Instead, we will implement a cache and store the image the first time we download it. Now, everytime we dequeue a reusable cell and populate it for a follower, instead of re-downloading the image data, we will check the cache to see if it exists and set it.
    GFNetworkManager.shared.getAvatarImage(for: follower) { [weak self] result in
      switch result {
      case .success(let image):
        DispatchQueue.main.async { self?.followerAvatarImageView.image = image }
      case . failure(_):
        return 
      }
    }
  }
  
}
