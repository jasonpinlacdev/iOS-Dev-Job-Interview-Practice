//
//  GFFollowerCell.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/10/20.
//

import UIKit

class GFFollowerCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: GFFollowerCell.self)
    
    let avatarImageView = GFAvatarImageView()
    let usernameLabel = GFFollowerCellUsernameLabel()
    lazy var verticalStackView = GFFollowerCellStackView(with: [avatarImageView, usernameLabel])

    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    func set(follower: GFFollower) {
        usernameLabel.text = follower.login
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layoutUI() {        
        contentView.addSubview(verticalStackView)
    
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])

    }
}
