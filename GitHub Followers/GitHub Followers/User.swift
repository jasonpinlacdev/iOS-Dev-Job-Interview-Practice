//
//  User.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/2/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation

struct User: Codable {
    
    let login: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    let htmlUrl: String
    let publicRepos: Int
    let publicGists: Int
    let followers: Int
    let following: Int
    let createdAt: String
    
}
