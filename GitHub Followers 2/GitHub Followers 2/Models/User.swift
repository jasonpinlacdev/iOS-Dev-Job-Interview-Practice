//
//  User.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/27/20.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarURL: String
    let name: String?
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGists: Int
    let htmlURL: String
    let following: Int
    let followers: Int
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case name
        case location
        case bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case htmlURL = "html_url"
        case following
        case followers
        case createdAt = "created_at"
    }
}
