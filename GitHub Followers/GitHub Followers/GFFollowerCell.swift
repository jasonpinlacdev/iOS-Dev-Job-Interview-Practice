//
//  GFFollowerCell.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/13/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let usernameLabel = GFTitleLabel(textAlignment: .center, size: 16.0)
   
    static var reuseID: String {
        get {
            return String(describing: self)
        }
    }
    private let padding: CGFloat = 8.0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAvatarImageView()
        configureUsernameLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(follower: Follower) {
        usernameLabel.text = follower.login
        
        // add code to set avatarImageView.image
    }
    
    
    private func configureAvatarImageView() {
        self.addSubview(avatarImageView)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor)
        ])
    }
    
    
    private func configureUsernameLabel() {
        self.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            usernameLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
