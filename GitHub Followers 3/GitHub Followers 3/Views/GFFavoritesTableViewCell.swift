//
//  GFFavoritesTableViewCell.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/30/21.
//

import UIKit

class GFFavoritesTableViewCell: UITableViewCell {
  
  static let reuseIdentifier = String(describing: GFFavoritesTableViewCell.self)
  
  let usernameLabel: UILabel = {
    let usernameLabel = UILabel()
    usernameLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    usernameLabel.textAlignment = .left
    usernameLabel.textColor = .label
    usernameLabel.lineBreakMode = .byTruncatingTail
    usernameLabel.translatesAutoresizingMaskIntoConstraints = false
    return usernameLabel
  }()
  
  let avatarImageView: UIImageView = {
    let avatarImageView = UIImageView()
    avatarImageView.image = GFImage.avatarPlaceHolder.image
    avatarImageView.contentMode = .scaleAspectFill
    avatarImageView.layer.cornerRadius = 16
    avatarImageView.clipsToBounds = true
    avatarImageView.translatesAutoresizingMaskIntoConstraints = false
    return avatarImageView
  }()
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureLayout()
    self.accessoryType = .disclosureIndicator
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  func set(username: String) {
    self.usernameLabel.text  = username
    self.getAvatarImage(for: username)
  }
  
  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    self.contentView.addSubview(avatarImageView)
    self.contentView.addSubview(usernameLabel)
    NSLayoutConstraint.activate([
      avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
      avatarImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -padding),
      avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor),
      avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
      
      usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
      usernameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
      usernameLabel.heightAnchor.constraint(equalTo: self.contentView.heightAnchor),
      usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
    ])
  }
  
  
  private func getAvatarImage(for username: String) {
    GFNetworkManager.shared.getUser(for: username) { result in
      switch result {
      case .success(let user):
        GFNetworkManager.shared.getAvatarImage(for: user.avatarURL) { result in
          switch result {
          case .success(let image):
            DispatchQueue.main.async { self.avatarImageView.image = image }
          case .failure(_):
            return
          }
        }
      case .failure(_):
        return
      }
    }
  }
  

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
