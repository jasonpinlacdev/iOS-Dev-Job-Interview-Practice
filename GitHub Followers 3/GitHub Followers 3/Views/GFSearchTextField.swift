//
//  GFSearchTextField.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/31/21.
//

import UIKit

class GFSearchTextField: UITextField {
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    placeholder = "Enter Username"
    textAlignment = .center
    
    font = UIFont.preferredFont(forTextStyle: .title1)
    adjustsFontSizeToFitWidth = true
    minimumFontSize = 18
    
    returnKeyType = .done
    autocorrectionType = .no
    
    clipsToBounds = true
    layer.cornerRadius = 32
    layer.borderWidth = 2.0
    layer.borderColor = UIColor.tertiaryLabel.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }

}
