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
    
    
    init(fontSize: CGFloat) {
        super.init(frame: .zero)
        configure()
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
    }
    
    
    // MARK: - Private Section -
    
    private func configure() {
        textAlignment = .left
        textColor = .secondaryLabel
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.90
        lineBreakMode = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
