//
//  Follower.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/11/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation


struct Follower: Codable, Hashable {
    let login: String
    let avatarURL: String
    
    
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(login)
    }

}
