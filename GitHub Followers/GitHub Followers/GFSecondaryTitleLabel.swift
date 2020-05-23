//
//  GFSecondaryTitleLabel.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/21/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, size: CGFloat) {
        super.init(frame: .zero)
        configure()
        self.textAlignment = textAlignment
        font = UIFont.systemFont(ofSize: size, weight: .medium)
    }
    
    func configure() {
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
