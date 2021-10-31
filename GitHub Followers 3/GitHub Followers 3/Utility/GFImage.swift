//
//  GFImage.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/31/21.
//

import UIKit


enum GFImage {
  case mainLogo
  case emptyStateLogo
  case avatarPlaceHolder
  
  var image: UIImage {
    switch self {
    case .mainLogo:
      return UIImage(named: "avatar-placeholder")!
    case .emptyStateLogo:
      return UIImage(named: "empty-state-logo")!
    case .avatarPlaceHolder:
      return UIImage(named: "gh-logo")!
    }
  }
  
  
}
