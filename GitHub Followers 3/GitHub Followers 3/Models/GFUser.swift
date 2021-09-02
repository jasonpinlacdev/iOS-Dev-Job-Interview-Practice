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

/* this is what i need as far as properties go for my User model
 {
 "login": "jasonpinlacdev",
 "avatar_url": "https://avatars.githubusercontent.com/u/49731117?v=4",
 "html_url": "https://github.com/jasonpinlacdev",
 "name": "Jason Pinlac",
 "location": "Tequesta Florida",
 "bio": "FAU Bachelor of Computer Science graduate.\r\niOS Swift Developer and Enthusiast.",
 "public_repos": 8,
 "public_gists": 0,
 "followers": 6,
 "following": 7,
 "created_at": "2019-04-17T18:47:30Z",
 }
 


/* this is a sample when I curl a username. IE curl https://api.github.com/users/jasonpinlacdev
{
  "login": "jasonpinlacdev",
  "id": 49731117,
  "node_id": "MDQ6VXNlcjQ5NzMxMTE3",
  "avatar_url": "https://avatars.githubusercontent.com/u/49731117?v=4",
  "gravatar_id": "",
  "url": "https://api.github.com/users/jasonpinlacdev",
  "html_url": "https://github.com/jasonpinlacdev",
  "followers_url": "https://api.github.com/users/jasonpinlacdev/followers",
  "following_url": "https://api.github.com/users/jasonpinlacdev/following{/other_user}",
  "gists_url": "https://api.github.com/users/jasonpinlacdev/gists{/gist_id}",
  "starred_url": "https://api.github.com/users/jasonpinlacdev/starred{/owner}{/repo}",
  "subscriptions_url": "https://api.github.com/users/jasonpinlacdev/subscriptions",
  "organizations_url": "https://api.github.com/users/jasonpinlacdev/orgs",
  "repos_url": "https://api.github.com/users/jasonpinlacdev/repos",
  "events_url": "https://api.github.com/users/jasonpinlacdev/events{/privacy}",
  "received_events_url": "https://api.github.com/users/jasonpinlacdev/received_events",
  "type": "User",
  "site_admin": false,
  "name": "Jason Pinlac",
  "company": null,
  "blog": "https://github.com/jasonpinlacdev",
  "location": "Tequesta Florida",
  "email": null,
  "hireable": true,
  "bio": "FAU Bachelor of Computer Science graduate.\r\niOS Swift Developer and Enthusiast.",
  "twitter_username": "jasonpinlacdev",
  "public_repos": 8,
  "public_gists": 0,
  "followers": 6,
  "following": 7,
  "created_at": "2019-04-17T18:47:30Z",
  "updated_at": "2021-08-31T20:15:38Z"
}

 */*/
