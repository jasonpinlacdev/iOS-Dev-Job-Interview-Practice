//
//  GFTitleLabel.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/1/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(textAlignment: NSTextAlignment, size: CGFloat) {
        super.init(frame: CGRect.zero)
        configure()
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: size, weight: UIFont.Weight.bold)
        
    }
    
    
    private func configure() {
        textColor = UIColor.label
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
