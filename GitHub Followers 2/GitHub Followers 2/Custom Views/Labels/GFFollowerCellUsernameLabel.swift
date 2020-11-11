//
//  GFFollowerCellUsernameLabel.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/10/20.
//

import UIKit

class GFFollowerCellUsernameLabel: UILabel {

    init() {
        super.init(frame: .zero)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        setContentHuggingPriority(.defaultHigh, for: .vertical)
        textAlignment = .center
        textColor = .label
        font = UIFont.systemFont(ofSize: 16.0)
    }
}
