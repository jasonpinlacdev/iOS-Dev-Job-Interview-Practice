//
//  User.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/11/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation


struct User: Codable {
    
    let login: String
    let avatarURL: String
    let htmlURL: String
    var name: String?
    var location: String?
    var bio: String?
    let publicRepos: Int
    let publicGists: Int
    let following: Int
    let followers: Int
    let createdAt: Date
    
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
        case htmlURL = "html_url"
        case name
        case location
        case bio
        case publicRepos = "public_repos"
        case publicGists = "public_gists"
        case following
        case followers
        case createdAt = "created_at"
    }
}





