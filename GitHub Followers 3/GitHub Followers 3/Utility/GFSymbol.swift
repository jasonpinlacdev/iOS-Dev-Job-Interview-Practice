//
//  GFSymbol.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/31/21.
//

import UIKit


enum GFSymbol {
  case followers // people person.3.sequence
  case following // heart heart
  case repos // folder folder
  case gists // lines of code text.alignleft
  case mapPin
  
  var image: UIImage? {
    switch self {
    case .followers:
      return UIImage(systemName: "person.2")
    case .following:
      return UIImage(systemName: "heart")
    case .repos:
      return UIImage(systemName: "folder")
    case .gists:
      return UIImage(systemName: "text.alignleft")
    case .mapPin:
      return UIImage(systemName: "mappin.and.ellipse")
    }
  }
  
}


