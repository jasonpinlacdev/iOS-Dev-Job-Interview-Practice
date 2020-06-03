//
//  GFButton.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        configure()
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    
    func set(title: String, color: UIColor) {
        setTitle(title, for: .normal)
        backgroundColor = color
    }

    
    // MARK: - Private Section -
    
    
    private func configure() {
        layer.cornerRadius = 10
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
