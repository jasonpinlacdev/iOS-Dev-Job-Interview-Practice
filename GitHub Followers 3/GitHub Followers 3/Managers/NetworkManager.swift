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
  
  private var baseURL = "https://api.github.com"
  
  private init() {}
   
  func getFollowers(for username: String, page: Int, completionHandler: @escaping (Result<[GFFollower], GFError>) -> Void) {
    let url = URL(string: baseURL + "/users/\(username)/followers?per_page=100&page=\(page)")!
    URLSession.shared.dataTask(with: url) { data, urlResponse, error in
      guard error == nil else { completionHandler(.failure(.networkError)); return }
      guard let httpURLResponse = urlResponse as? HTTPURLResponse, httpURLResponse.statusCode == 200 else { completionHandler(.failure(.httpURLReponseError)); return }
      guard let jsonData = data else { completionHandler(.failure(.dataError)); return }
      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: jsonData) else { completionHandler(.failure(.jsonDecodingError)); return }
      completionHandler(.success(followers))
    }.resume()
  }
  
  func getUser(for username: String, completionHandler: @escaping (Result<GFUser, GFError>) -> Void) {
    let url = URL(string: baseURL + "/users/\(username)")!
    URLSession.shared.dataTask(with: url) { data, urlResponse, error in
      guard error == nil else { completionHandler(.failure(.networkError)); return }
      guard let httpURLResponse = urlResponse as? HTTPURLResponse, httpURLResponse.statusCode == 200 else { completionHandler(.failure(.httpURLReponseError)); return }
      guard let jsonData = data else { completionHandler(.failure(.dataError)); return }
      guard let user = try? JSONDecoder().decode(GFUser.self, from: jsonData) else { completionHandler(.failure(.jsonDecodingError)); return }
      completionHandler(.success(user))
    }.resume()
  }
  
}
