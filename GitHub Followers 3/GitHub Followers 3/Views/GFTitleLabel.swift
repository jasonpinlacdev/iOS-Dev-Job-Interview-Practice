//
//  GFTitleLabel.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFTitleLabel: UILabel {
  
  init(alignment: NSTextAlignment, fontSize: CGFloat) {
    super.init(frame: .zero)
    self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    self.textAlignment = alignment
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.textColor = .label
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.90
    self.lineBreakMode = .byTruncatingTail
    self.translatesAutoresizingMaskIntoConstraints = false
  }

  
}
