//
//  GFTitleLabel.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFTitleLabel: UILabel {
  
  let titleAlignment: NSTextAlignment
  
  init(alignment: NSTextAlignment) {
    self.titleAlignment = alignment
    super.init(frame: .zero)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.textAlignment = self.titleAlignment
    self.textColor = .label
    self.font = UIFont.preferredFont(forTextStyle: .title1)
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.90
    self.lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }
}
