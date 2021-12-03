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
  let buttonImage: UIImage?
  
  
  init(title: String, color: UIColor, image: UIImage? = nil) {
    self.buttonTitle = title
    self.buttonColor = color
    self.buttonImage = image
    super.init(frame: .zero)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    self.configuration = UIButton.Configuration.filled()
    self.configuration?.baseBackgroundColor = self.buttonColor
    self.configuration?.baseForegroundColor = .white
    self.configuration?.cornerStyle = .capsule
  
    var container = AttributeContainer()
    container.font = UIFont.preferredFont(forTextStyle: .title1)
    self.configuration?.attributedTitle = AttributedString(self.buttonTitle, attributes: container)

    if let buttonImage = self.buttonImage {
      self.configuration?.image = buttonImage
      self.configuration?.imagePadding = 10.0
      self.configuration?.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(font: UIFont.preferredFont(forTextStyle: .title1))
    }

    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
}
