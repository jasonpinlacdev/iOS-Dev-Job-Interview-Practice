//
//  GFUser.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import Foundation

struct GFUser {
  let login: String
  let avatarURL: String
  let name: String?
  let blog: String?
  let location: String?
  let bio: String?
  let publicRepos: Int
  let publicGists: Int
  let followers: Int
  let following: Int
  let createdAt: String
  let htmlURL: String
}

extension GFUser: Codable {
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarURL = "avatar_url"
    case name
    case blog
    case location
    case bio
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers
    case following
    case createdAt = "created_at"
    case htmlURL = "html_url"
  }
  
}

