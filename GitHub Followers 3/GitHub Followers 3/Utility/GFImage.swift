//
//  GFImage.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/10/21.
//

import Foundation
import UIKit

enum GFImage {
  case logo
  case emptyStateLogo
  case avatarPlaceholder
  
  var image: UIImage? {
    switch self {
    case .logo:
      return UIImage(named: "gh-logo")
    case .emptyStateLogo:
      return UIImage(named: "empty-state-logo")
    case .avatarPlaceholder:
      return UIImage(named: "avatar-placeholder")
    }
  }
}
