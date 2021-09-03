//
//  GFFollower.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import Foundation


struct GFFollower: Codable {
  let login: String
  let avatarURL: String
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarURL = "avatar_url"
  }
}
