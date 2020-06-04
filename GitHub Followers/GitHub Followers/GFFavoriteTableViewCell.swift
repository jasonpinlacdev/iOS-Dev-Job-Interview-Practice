//
//  GFFavoriteTableViewCell.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/30/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFFavoriteTableViewCell: UITableViewCell {
    
    static var reuseID = "GFFavoriteTableViewCell"
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .left, size: 26)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        layoutUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        NetworkManager.shared.getAvatarImage(from: favorite.avatarURL) { avatarImage in
            DispatchQueue.main.async {
                self.avatarImageView.image = avatarImage
            }
        }
    }
    
    
    // MARK: - Private Section -
    
    
    private func configure() {
        accessoryType = .disclosureIndicator
    }
    
    
    private func layoutUI() {
        let padding: CGFloat = 12.0
        
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 60),
            avatarImageView.heightAnchor.constraint(equalToConstant: 60),
            
            usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
            usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
}
