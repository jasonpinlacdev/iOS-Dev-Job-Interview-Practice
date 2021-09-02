//
//  GFBodyLabel.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFBodyLabel: UILabel {

  init(alignment: NSTextAlignment) {
    super.init(frame: .zero)
    self.textAlignment = alignment
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.font = UIFont.preferredFont(forTextStyle: .title1)
    self.textColor = .secondaryLabel
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.75
    self.lineBreakMode = .byWordWrapping
    self.numberOfLines = 0
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  


}
