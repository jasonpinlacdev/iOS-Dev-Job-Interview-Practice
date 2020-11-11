//
//  GFFollower.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/27/20.
//

import Foundation

struct GFFollower: Codable {
    
    let identifier = UUID().uuidString
    let login: String
    let avatarURL: String

    
    enum CodingKeys: String, CodingKey {
        // left is the models property name. right is the json data key name. you have to have all cases for all model properties even if the property name is the same as the json data key name.
        case login
        case avatarURL = "avatar_url"
    }
}

extension GFFollower: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    static func ==(lhs: GFFollower, rhs: GFFollower) -> Bool {
        return lhs.login == rhs.login
    }
}

