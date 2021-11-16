//
//  GFUserDetailInformationView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

class GFUserDetailInformationView: UIView {
  
  let user: GFUser
  
  let userAvatarImageView: UIImageView = {
    let userAvatarImageView = UIImageView(image: GFImage.avatarPlaceHolder.image)
    userAvatarImageView.translatesAutoresizingMaskIntoConstraints = false
    userAvatarImageView.contentMode = .scaleAspectFill
    userAvatarImageView.clipsToBounds = true
    userAvatarImageView.layer.cornerRadius = 10
    return userAvatarImageView
  }()
  
  let usernameLabel: GFTitleLabel = {
    let usernameLabel = GFTitleLabel(alignment: .left)
    return usernameLabel
  }()
  
  let realNameLabel: GFTitleLabel = {
    let realNameLabel = GFTitleLabel(alignment: .left)
    realNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    realNameLabel.textColor = .secondaryLabel
    return realNameLabel
  }()
  
  let locationPinImageView: UIImageView = {
    let locationPinImageView = UIImageView(image: GFSymbol.mapPin.image)
    locationPinImageView.contentMode = .scaleAspectFill
    locationPinImageView.translatesAutoresizingMaskIntoConstraints = false
    return locationPinImageView
  }()
  
  let locationLabel: GFTitleLabel = {
    let locationLabel = GFTitleLabel(alignment: .left)
    locationLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    locationLabel.textColor = .secondaryLabel
    locationLabel.lineBreakMode = .byTruncatingTail
    return locationLabel
  }()
  
  let bioLabel: UILabel = {
    let bioLabel = UILabel()
    bioLabel.isUserInteractionEnabled = false
    bioLabel.textColor = .secondaryLabel
    bioLabel.textAlignment = .left
    bioLabel.numberOfLines = 0
    bioLabel.sizeToFit()
    bioLabel.translatesAutoresizingMaskIntoConstraints = false
    return bioLabel
  }()
  
  
  
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
    GFNetworkManager.shared.getAvatarImage(for: user.avatarURL) { result in
      switch result {
      case .success(let image):
        DispatchQueue.main.async {
          self.userAvatarImageView.image = image
        }
      case .failure(_):
        return
      }
    }
    
    self.usernameLabel.text = self.user.login
    self.realNameLabel.text = self.user.name ?? "Name N/A"
    self.locationPinImageView.tintColor = .label
    self.locationLabel.text = self.user.location ?? "Location N/A"
    self.bioLabel.text = self.user.bio ?? "Biography N/A"
  }
  
  private func configureLayout() {
    
    let padding: CGFloat = 10.0
    self.addSubview(userAvatarImageView)
    self.addSubview(usernameLabel)
    self.addSubview(realNameLabel)
    self.addSubview(locationPinImageView)
    self.addSubview(locationLabel)
    self.addSubview(bioLabel)
    
    NSLayoutConstraint.activate([
      userAvatarImageView.topAnchor.constraint(equalTo: self.topAnchor),
      userAvatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      userAvatarImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.35),
      userAvatarImageView.heightAnchor.constraint(equalTo: userAvatarImageView.widthAnchor),
      
      usernameLabel.topAnchor.constraint(equalTo: self.topAnchor),
      usernameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: padding),
      usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      realNameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: padding),
      realNameLabel.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: padding),
      realNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      locationPinImageView.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: padding),
      locationPinImageView.leadingAnchor.constraint(equalTo: userAvatarImageView.trailingAnchor, constant: padding),
      locationPinImageView.heightAnchor.constraint(equalTo: realNameLabel.heightAnchor),
      locationPinImageView.widthAnchor.constraint(equalTo: realNameLabel.heightAnchor),

      locationLabel.topAnchor.constraint(equalTo: realNameLabel.bottomAnchor, constant: padding),
      locationLabel.leadingAnchor.constraint(equalTo: locationPinImageView.trailingAnchor, constant: padding),
      locationLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      
      bioLabel.topAnchor.constraint(equalTo: userAvatarImageView.bottomAnchor, constant: padding),
      bioLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      bioLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    ])
  }

}
