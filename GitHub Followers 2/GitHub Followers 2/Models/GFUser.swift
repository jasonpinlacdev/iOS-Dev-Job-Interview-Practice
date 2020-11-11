//
//  GFUser.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/27/20.
//

import Foundation

struct GFUser: Codable {

    let identifier = UUID().uuidString
    
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
        // left is the models property name. right is the json data key name. you have to have all cases for all model properties even if the property name is the same as the json data key name.
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


extension GFUser: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: GFUser, rhs: GFUser) -> Bool {
        return lhs.login == rhs.login
    }
}
