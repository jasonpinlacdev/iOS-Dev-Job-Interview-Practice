//
//  GFNetworkManager.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

class GFNetworkManager  {

  static let shared =  GFNetworkManager()
  
  private init() {}
  
  private let baseURL = "https://api.github.com"
  //example for parameters -> https://api.github.com/users/jasonpinlacdev/followers?per_page=1&page=3

  
  
  func getFollowers(for username: String, perPage: Int = 100, page: Int = 1, completionHandler: @escaping (Result<[GFFollower], GFError>) -> Void) {
    
    let endPoint = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
    let url = URL(string: endPoint)!
    
    let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
      //This closure is executed at the end of the datatask and is async on a background thread
      guard error == nil else { completionHandler(.failure(.localError)); return }
      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { completionHandler(.failure(.serverError)); return }
      guard let data = data else { completionHandler(.failure(.dataError)); return }
      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: data) else { completionHandler(.failure(.dataDecodingError)); return }
      completionHandler(.success(followers))
    }
    
    task.resume()
  }
  
  


//  func getFollowers(for username: String, perPage: Int = 100, page: Int, completionHandler: @escaping ((GFError?, [GFFollower]?) -> Void)) {
//
//    let endPoint = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
//    let url = URL(string: endPoint)!
//
//    let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
//      //This closure is executed at the end of the datatask and is async on a background thread
//      guard error == nil else { completionHandler(.localError, nil); return }
//
//      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { completionHandler(.serverError, nil); return }
//
//      guard let data = data else { completionHandler(.dataError, nil); return }
//
//      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: data) else { completionHandler(.dataDecodingError, nil); return }
//
//      completionHandler(nil, followers)
//    }
//
//    task.resume()
//  }
  
  
  
}
