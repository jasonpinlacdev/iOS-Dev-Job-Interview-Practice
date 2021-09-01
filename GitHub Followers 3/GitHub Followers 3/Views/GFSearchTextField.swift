//
//  GFSearchTextField.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 8/31/21.
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
    self.layer.cornerRadius = 10
    self.layer.borderWidth = 2
    self.layer.borderColor = UIColor.systemGray4.cgColor
    self.textColor = .label
    self.tintColor = .label
    self.textAlignment = .center
    self.font = UIFont.preferredFont(forTextStyle: .title2)
    self.adjustsFontSizeToFitWidth = true
    self.minimumFontSize = 12
    self.backgroundColor = .tertiarySystemBackground
    self.autocorrectionType = .no
    self.translatesAutoresizingMaskIntoConstraints = false
    self.placeholder = "Username"
  }
  
}
