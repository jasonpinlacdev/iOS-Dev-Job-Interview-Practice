//
//  GFButton.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/10/21.
//

import UIKit

class GFButton: UIButton {
  
  let color: UIColor
  let text: String
  
  init(text: String, color: UIColor) {
    self.text = text
    self.color = color
    super.init(frame: .zero)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    backgroundColor = color
  
    setTitle(text, for: .normal)
    setTitleColor(.white, for: .normal)
    setTitleColor(UIColor(white: 1.0, alpha: 0.3), for: .highlighted)
    titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
    
    clipsToBounds = true
    layer.cornerRadius = 32
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}

