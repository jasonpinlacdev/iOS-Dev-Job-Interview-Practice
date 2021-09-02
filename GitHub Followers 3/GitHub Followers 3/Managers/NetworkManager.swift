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
  
  private init() {}
  
  func getFollowers(for username: String, completionHandler: @escaping (Result<String, GFError>) -> Void) {
    let username = username
    let url = URL(string: "https://api.github.com/users/\(username)/followers")!
    URLSession.shared.dataTask(with: url) { data, response, error in
      // this is the completion handler when the network call has completed
      if let data = data {
        if let dataAsString = String(data: data, encoding: .utf8) {
          completionHandler(.success(dataAsString))
        }
      } else {
        completionHandler(.failure(GFError.networkError))
      }
    }.resume()
  }
  
}
