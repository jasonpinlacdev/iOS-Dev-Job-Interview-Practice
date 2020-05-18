//
//  GFAvatarImageView.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/13/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    private let placeholderImage = UIImage(named: "avatar-placeholder")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        self.image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}




