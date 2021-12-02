//
//  GFSecondaryTitleLabel.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/18/21.
//

import UIKit

class GFSecondaryTitleLabel: UILabel {

  private let titleAlignment: NSTextAlignment
  private let labelTextColor: UIColor
  
  
  init(alignment: NSTextAlignment, labelTextColor: UIColor) {
    self.titleAlignment = alignment
    self.labelTextColor = labelTextColor
    super.init(frame: .zero)
    configure()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    self.textAlignment = self.titleAlignment
    self.textColor = self.labelTextColor
    self.font = UIFont.preferredFont(forTextStyle: .title2)
    self.adjustsFontSizeToFitWidth = true
    self.minimumScaleFactor = 0.90
    self.lineBreakMode = .byTruncatingTail
    translatesAutoresizingMaskIntoConstraints = false
  }

}
