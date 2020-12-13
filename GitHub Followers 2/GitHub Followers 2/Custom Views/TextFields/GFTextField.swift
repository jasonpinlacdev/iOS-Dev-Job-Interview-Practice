//
//  GTextField.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
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
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10.0
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray3.cgColor
        backgroundColor = .tertiarySystemGroupedBackground
        textColor = .label
        textAlignment = .center
        font = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 10.0
        autocorrectionType = .no
        placeholder = "Enter a username"
        returnKeyType = .done
        clearButtonMode = .whileEditing
    }
    
}
