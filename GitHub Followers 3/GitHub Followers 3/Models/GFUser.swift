//
//  GFUser.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import Foundation


struct GFUser: Codable {
  let login: String
  let avatarURL: String
  let htmlURL: String
  let name: String?
  let location: String?
  let boi: String?
  let publicRepos: Int
  let publicGists: Int
  let followers: Int
  let following: Int
  let createdAt: String
  
  enum CodingKeys: String, CodingKey {
    case login
    case avatarURL = "avatar_url"
    case htmlURL = "html_url"
    case name
    case location
    case boi
    case publicRepos = "public_repos"
    case publicGists = "public_gists"
    case followers
    case following
    case createdAt = "created_at"
  }
}
