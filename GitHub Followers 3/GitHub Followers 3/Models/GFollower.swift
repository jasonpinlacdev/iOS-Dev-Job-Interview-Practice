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
}

extension GFFollower: Codable {
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarURL = "avatar_url"
  }
  
}


