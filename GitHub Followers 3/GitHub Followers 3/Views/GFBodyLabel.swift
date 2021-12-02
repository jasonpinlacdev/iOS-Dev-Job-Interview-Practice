//
//  GFBodyLabel.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFBodyLabel: UILabel {
  
  let bodyAlignment: NSTextAlignment

  
  init(alignment: NSTextAlignment) {
    self.bodyAlignment = alignment
    super.init(frame: .zero)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    self.textAlignment = self.bodyAlignment
    self.font = UIFont.preferredFont(forTextStyle: .title2)
    self.textColor = .secondaryLabel
    
    self.numberOfLines = 0
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.75

    translatesAutoresizingMaskIntoConstraints = false
  }

}
