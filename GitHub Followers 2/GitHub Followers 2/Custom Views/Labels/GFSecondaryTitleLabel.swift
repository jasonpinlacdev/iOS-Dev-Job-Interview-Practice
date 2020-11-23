//
//  GFSecondaryTitleLabel.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/22/20.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

    init(fontSize: CGFloat, text: String) {
        super.init(frame: .zero)
        configure(fontSize: fontSize, text: text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(fontSize: CGFloat, text: String) {
        self.text = text
        font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        textColor = .secondaryLabel
        textAlignment = .left
        lineBreakMode = .byTruncatingTail
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.9
        translatesAutoresizingMaskIntoConstraints = false
    }
}
