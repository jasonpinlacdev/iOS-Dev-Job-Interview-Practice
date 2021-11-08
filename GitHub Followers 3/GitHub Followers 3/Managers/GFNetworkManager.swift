//
//  GFNetworkManager.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

class GFNetworkManager  {
  
  static let shared =  GFNetworkManager()
  
  private let avatarImageCache = NSCache<NSString, UIImage>() // an NSCache is just a dictionary but special. It's special because the OS will automatically remove objects from the cache if the device is running low on memory. Helpfully, if the system does encounter memory pressure NSCache will automatically start to remove items without you knowing about it, which means you won't get a memory warning unless even more RAM needs to be cleared. It will also remove items intelligently, trying to keep as much cached as possible.
  
  private let baseURL = "https://api.github.com"
  
  private init() {}
  
  
  
  func getFollowers(for username: String, perPage: Int = 100, page: Int = 1, completionHandler: @escaping (Result<[GFFollower], GFError>) -> Void) {
    //example for parameters -> https://api.github.com/users/jasonpinlacdev/followers?per_page=1&page=3
    let endPoint = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
    guard let url = URL(string: endPoint) else {
      completionHandler(.failure(.invalidUsername))
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
      //This closure is executed at the end of the datatask and is async on a background thread
      guard error == nil else {
        completionHandler(.failure(.localError))
        return
      }
      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else {
        completionHandler(.failure(.serverError))
        return
      }
      guard let data = data else {
        completionHandler(.failure(.dataError))
        return
      }
      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: data) else {
        completionHandler(.failure(.dataDecodingError))
        return
      }
      completionHandler(.success(followers))
    }
    
    task.resume()
  }
  
  
  
  func getAvatarImage(for follower: GFFollower, completionHandler: @escaping (Result<UIImage?, GFError>) -> Void){
    // check to see if image already exists in cache. Use the follower avatarURL as the key
    let avatarImageCacheKey = NSString(string: follower.avatarURL)
    if let avatarImage = self.avatarImageCache.object(forKey: avatarImageCacheKey) {
      // if it does, retrieve image from cache and pass in as the success result of our completion handler param of type Result
      completionHandler(.success(avatarImage))
    } else {
      // if it doesn't make the async network call and then store it in the cache right before we call the completion handler and pass the avatar UIImage
      DispatchQueue.global(qos: .utility).async { [weak self] in
        let imageEndpoint = follower.avatarURL
        guard let imageURL = URL(string: imageEndpoint) else { completionHandler(.failure(.avatarImageDownloadError)); return }
        guard let imageData = try? Data(contentsOf: imageURL) else { completionHandler(.failure(.avatarImageDownloadError)); return }
        let avatarImage = UIImage(data: imageData)
        if let avatarImage = avatarImage {
          self?.avatarImageCache.setObject(avatarImage, forKey: avatarImageCacheKey)
        }
        completionHandler(.success(avatarImage))
      }
    }
   
  }
  
  
  
  
  //  func getFollowers(for username: String, perPage: Int = 100, page: Int, completionHandler: @escaping ((GFError?, [GFFollower]?) -> Void)) {
  //
  //    let endPoint = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
  //    let url = URL(string: endPoint)!
  //
  //    let task = URLSession.shared.dataTask(with: url) { data, urlResponse, error in
  //      //This closure is executed at the end of the datatask and is async on a background thread
  //      guard error == nil else { completionHandler(.localError, nil); return }
  //      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { completionHandler(.serverError, nil); return }
  //      guard let data = data else { completionHandler(.dataError, nil); return }
  //      guard let followers = try? JSONDecoder().decode([GFFollower].self, from: data) else { completionHandler(.dataDecodingError, nil); return }
  //      completionHandler(nil, followers)
  //    }
  //
  //    task.resume()
  //  }
  
  
  
}
