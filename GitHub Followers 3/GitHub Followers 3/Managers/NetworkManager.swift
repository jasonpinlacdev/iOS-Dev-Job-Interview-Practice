//
//  NetworkManager.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import Foundation

class NetworkManager {
  // singleton
  
  static let shared = NetworkManager()
  
  private var baseURL = "https://api.github.com/users"
  
  private init() {}
  
  
  func getFollowers(for username: String, page: Int, completionHandler: @escaping (Result<[GFFollower], GFError>) -> Void) {
    let username = username
    let url = URL(string: "https://api.github.com/users/\(username)/followers?per_page=100&page=\(page)")!
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard error == nil else { completionHandler(.failure(.networkError)); return }
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { completionHandler(.failure(.httpReponseError)); return }
      guard let data = data else { completionHandler(.failure(.dataError)); return }
      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: data) else { completionHandler(.failure(.jsonDecodingError)); return }
      completionHandler(.success(followers))
    }.resume()
    
  }
  
}
