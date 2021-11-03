//
//  GFNetworkManager.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

class GFNetworkManager  {
  
  private let baseURL = "https://api.github.com"
  //example for parameters -> https://api.github.com/users/jasonpinlacdev/followers?per_page=1&page=3
  
  static let shared =  GFNetworkManager()
  
  private init() {}
  
  func getFollowers(for username: String, completionHandler:  ((String) -> Void)? = nil ) {
    let url = URL(string: baseURL + "/users/\(username)/followers")!
    let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
      //This closure is executed at the end of the datatask and is async on a background thread
      
      guard error == nil else { completionHandler?("local error"); return }
      
      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { completionHandler?("server error"); return }

      
      guard let data = data else { completionHandler?("data error"); return }
      
      let res = (String(data: data, encoding: .utf8))!
      completionHandler?(res)
    }
    task.resume()
  }
  
  
  
}
