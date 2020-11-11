//
//  GFFollowerCellStackView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/10/20.
//

import UIKit

class GFFollowerCellStackView: UIStackView {
    
    init(with arrangedSubviews: [UIView]) {
        super.init(frame: .zero)
        configure(with: arrangedSubviews)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(with arrangedSubviews: [UIView]) {
        translatesAutoresizingMaskIntoConstraints = false
        axis = .vertical
        alignment = .center
        distribution = .fill
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }

}
