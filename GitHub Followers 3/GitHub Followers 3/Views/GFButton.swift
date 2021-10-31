//
//  GFButton.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/31/21.
//

import UIKit

class GFButton: UIButton {
  
  let buttonTitle: String
  let buttonColor: UIColor
  
  init(title: String, color: UIColor) {
    self.buttonTitle = title
    self.buttonColor = color
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.setTitle(self.buttonTitle, for: .normal)
    self.backgroundColor = self.buttonColor
    self.setTitleColor(.white, for: .normal)
    self.setTitleColor(UIColor(white: 1.0, alpha: 0.5), for: .highlighted)
    self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)

    clipsToBounds = true
    layer.cornerRadius = 32
    self.translatesAutoresizingMaskIntoConstraints = false
  }
}
