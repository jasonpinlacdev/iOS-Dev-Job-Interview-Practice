//
//  GFLogoImageView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/10/21.
//

import UIKit

class GFImageView: UIImageView {

  override init(image: UIImage?) {
    super.init(image: image)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    contentMode = .scaleAspectFit
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
