//
//  GFButton.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    // when you initialize a UIButton programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    //    convenience init(backgroundColor: UIColor, title: String) {
    //        self.init(frame: .zero)
    //        self.backgroundColor = backgroundColor
    //        self.setTitle(title, for: .normal)
    //    }
    
    
    // when you initialize the GF button via storyboard
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}
