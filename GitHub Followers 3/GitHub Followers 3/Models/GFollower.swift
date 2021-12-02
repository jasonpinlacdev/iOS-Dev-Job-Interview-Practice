//
//  GFollower.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import Foundation

struct GFFollower {

  let login: String
  let avatarURL: String
  let uniqueIdentifier: String = UUID().uuidString
  
}


extension GFFollower: Codable {
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarURL = "avatar_url"
  }
  
}


extension GFFollower: Hashable {
  
  static func ==(lhs: GFFollower, rhs: GFFollower) -> Bool {
    return lhs.login == rhs.login && lhs.avatarURL == rhs.avatarURL && lhs.uniqueIdentifier == rhs.uniqueIdentifier
  }
  
  
  func hash(into hasher: inout Hasher) {
    hasher.combine(login)
    hasher.combine(avatarURL)
    hasher.combine(uniqueIdentifier)
  }
  
}


