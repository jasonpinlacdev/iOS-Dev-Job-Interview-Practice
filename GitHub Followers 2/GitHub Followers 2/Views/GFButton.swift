//
//  GFButton.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/20/20.
//

import UIKit

final class GFButton: UIButton {
    
    let title: String
    let color: UIColor
    
    init(title: String, color: UIColor) {
        self.title = title
        self.color = color
        super.init(frame: .zero)
        configureButton()
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureButton() {
        self.titleLabel?.text = title
        self.backgroundColor = color
    }
    
}
