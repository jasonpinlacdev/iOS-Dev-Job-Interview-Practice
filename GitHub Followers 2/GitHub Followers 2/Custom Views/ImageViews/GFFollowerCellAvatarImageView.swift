//
//  GFFollowerCellAvatarImageView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/10/20.
//

import UIKit

class GFFollowerCellAvatarImageView: UIImageView {

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
        
        layer.cornerRadius = 16.0
        clipsToBounds = true

        image = UIImage(named: GFImage.avatarPlaceholder.rawValue)
    }
    
}
