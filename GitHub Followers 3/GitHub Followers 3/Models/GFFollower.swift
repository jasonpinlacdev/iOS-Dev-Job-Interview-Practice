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


/* this is what i need as far as properties go for my follower model
 {
   "login": "JMMoseley",
   "avatar_url": "https://avatars.githubusercontent.com/u/56412497?v=4",
 }
 
 
 
 */

/* this is a sample when I curl a username's followers. IE curl https://api.github.com/users/jasonpinlacdev/followers
[
  {
    "login": "MichaelPietrzak",
    "id": 19438507,
    "node_id": "MDQ6VXNlcjE5NDM4NTA3",
    "avatar_url": "https://avatars.githubusercontent.com/u/19438507?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/MichaelPietrzak",
    "html_url": "https://github.com/MichaelPietrzak",
    "followers_url": "https://api.github.com/users/MichaelPietrzak/followers",
    "following_url": "https://api.github.com/users/MichaelPietrzak/following{/other_user}",
    "gists_url": "https://api.github.com/users/MichaelPietrzak/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/MichaelPietrzak/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/MichaelPietrzak/subscriptions",
    "organizations_url": "https://api.github.com/users/MichaelPietrzak/orgs",
    "repos_url": "https://api.github.com/users/MichaelPietrzak/repos",
    "events_url": "https://api.github.com/users/MichaelPietrzak/events{/privacy}",
    "received_events_url": "https://api.github.com/users/MichaelPietrzak/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "Raulnimje",
    "id": 52788381,
    "node_id": "MDQ6VXNlcjUyNzg4Mzgx",
    "avatar_url": "https://avatars.githubusercontent.com/u/52788381?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/Raulnimje",
    "html_url": "https://github.com/Raulnimje",
    "followers_url": "https://api.github.com/users/Raulnimje/followers",
    "following_url": "https://api.github.com/users/Raulnimje/following{/other_user}",
    "gists_url": "https://api.github.com/users/Raulnimje/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/Raulnimje/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/Raulnimje/subscriptions",
    "organizations_url": "https://api.github.com/users/Raulnimje/orgs",
    "repos_url": "https://api.github.com/users/Raulnimje/repos",
    "events_url": "https://api.github.com/users/Raulnimje/events{/privacy}",
    "received_events_url": "https://api.github.com/users/Raulnimje/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "JMMoseley",
    "id": 56412497,
    "node_id": "MDQ6VXNlcjU2NDEyNDk3",
    "avatar_url": "https://avatars.githubusercontent.com/u/56412497?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/JMMoseley",
    "html_url": "https://github.com/JMMoseley",
    "followers_url": "https://api.github.com/users/JMMoseley/followers",
    "following_url": "https://api.github.com/users/JMMoseley/following{/other_user}",
    "gists_url": "https://api.github.com/users/JMMoseley/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/JMMoseley/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/JMMoseley/subscriptions",
    "organizations_url": "https://api.github.com/users/JMMoseley/orgs",
    "repos_url": "https://api.github.com/users/JMMoseley/repos",
    "events_url": "https://api.github.com/users/JMMoseley/events{/privacy}",
    "received_events_url": "https://api.github.com/users/JMMoseley/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "hardipgajera",
    "id": 59595317,
    "node_id": "MDQ6VXNlcjU5NTk1MzE3",
    "avatar_url": "https://avatars.githubusercontent.com/u/59595317?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/hardipgajera",
    "html_url": "https://github.com/hardipgajera",
    "followers_url": "https://api.github.com/users/hardipgajera/followers",
    "following_url": "https://api.github.com/users/hardipgajera/following{/other_user}",
    "gists_url": "https://api.github.com/users/hardipgajera/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/hardipgajera/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/hardipgajera/subscriptions",
    "organizations_url": "https://api.github.com/users/hardipgajera/orgs",
    "repos_url": "https://api.github.com/users/hardipgajera/repos",
    "events_url": "https://api.github.com/users/hardipgajera/events{/privacy}",
    "received_events_url": "https://api.github.com/users/hardipgajera/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "Simon-Moseley",
    "id": 60559564,
    "node_id": "MDQ6VXNlcjYwNTU5NTY0",
    "avatar_url": "https://avatars.githubusercontent.com/u/60559564?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/Simon-Moseley",
    "html_url": "https://github.com/Simon-Moseley",
    "followers_url": "https://api.github.com/users/Simon-Moseley/followers",
    "following_url": "https://api.github.com/users/Simon-Moseley/following{/other_user}",
    "gists_url": "https://api.github.com/users/Simon-Moseley/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/Simon-Moseley/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/Simon-Moseley/subscriptions",
    "organizations_url": "https://api.github.com/users/Simon-Moseley/orgs",
    "repos_url": "https://api.github.com/users/Simon-Moseley/repos",
    "events_url": "https://api.github.com/users/Simon-Moseley/events{/privacy}",
    "received_events_url": "https://api.github.com/users/Simon-Moseley/received_events",
    "type": "User",
    "site_admin": false
  },
  {
    "login": "Kate079",
    "id": 82218008,
    "node_id": "MDQ6VXNlcjgyMjE4MDA4",
    "avatar_url": "https://avatars.githubusercontent.com/u/82218008?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/Kate079",
    "html_url": "https://github.com/Kate079",
    "followers_url": "https://api.github.com/users/Kate079/followers",
    "following_url": "https://api.github.com/users/Kate079/following{/other_user}",
    "gists_url": "https://api.github.com/users/Kate079/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/Kate079/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/Kate079/subscriptions",
    "organizations_url": "https://api.github.com/users/Kate079/orgs",
    "repos_url": "https://api.github.com/users/Kate079/repos",
    "events_url": "https://api.github.com/users/Kate079/events{/privacy}",
    "received_events_url": "https://api.github.com/users/Kate079/received_events",
    "type": "User",
    "site_admin": false
  }
]
*/

