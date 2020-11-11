//
//  GFAlertVerticalStackView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFAlertStackView: UIStackView {

    init(arrangedSubviews: [UIView]) {
        super.init(frame: .zero)
        configure(arrangedSubviews: arrangedSubviews)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(arrangedSubviews: [UIView]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .equalSpacing
        arrangedSubviews.forEach { self.addArrangedSubview($0) }
    }

}
