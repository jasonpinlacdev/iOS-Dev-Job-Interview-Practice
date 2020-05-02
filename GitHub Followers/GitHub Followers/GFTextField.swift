//
//  GFTextField.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        layer.cornerRadius = 10
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label
        tintColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12.0
        
        backgroundColor = UIColor.tertiarySystemBackground
        autocorrectionType = .no
        autocapitalizationType = .none
        
        placeholder = "Enter a username"
        returnKeyType = UIReturnKeyType.go
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
