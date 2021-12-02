//
//  UIView+ShowYellowBorder.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/15/21.
//

import UIKit

extension UIView {
  
  func enableYellowBorder() {
    self.layer.borderColor = UIColor.systemYellow.cgColor
    self.layer.borderWidth = 2.0
    self.clipsToBounds = true
  }
  
}
