//
//  GFFollowerCellAvatarImageView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/10/20.
//

import UIKit

class GFAvatarImageView: UIImageView {

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .scaleAspectFit
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.cornerRadius = 16.0
        clipsToBounds = true
        image = GFImage.avatarPlaceholder
    }
    
}
