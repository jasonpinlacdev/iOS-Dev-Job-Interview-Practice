//
//  GFButton.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 8/31/21.
//

import UIKit

class GFButton: UIButton {
  
  // This is a custom subclass of UIButton. Because I want to get the native functionality with "soft fading/highlighting on tap" effect I dont actually use this custom button.
  // I implemented this class to follow along with the course even though I dont use it.
  // The reason is because I learned its better to simply wrap Apple's system controls.
  // IE. Wrap the instantiation of Apple's UIButton of system type with a closure and assign it to the variable/property.
  
  init() {
    super.init(frame: .zero)
    configure()
  }
  
  convenience init(buttonTitle: String, buttonColor: UIColor) {
    self.init()
    self.setTitle(buttonTitle, for: .normal)
    self.backgroundColor = buttonColor
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // this configure method is to setup the basic look of a GFButton
  private func configure() {
    self.setTitleColor(.white, for: .normal)
    self.setTitleColor(UIColor(white: 1.0, alpha: 0.3), for: .highlighted)
    self.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
    self.layer.cornerRadius = 10
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
