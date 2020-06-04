//
//  GFBodyLabel.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/1/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: CGRect.zero)
        self.textAlignment = textAlignment
    }
    
    
    // MARK: - Private Section -
    
    
    private func configure() {
        font = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
        
        textColor = UIColor.secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.75
        lineBreakMode = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints = false
    }
}
