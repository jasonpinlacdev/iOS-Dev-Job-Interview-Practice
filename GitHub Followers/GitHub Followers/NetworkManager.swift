//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/4/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.github.com"
    private let perPage = 100
    
    private init() {}
    
    func getFollowers(for username: String, page: Int, completionHandler: @escaping (Result<[Follower], GFError>) -> Void) {
        let urlString = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.invalidUsername))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check for client error
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }
            
            // check server response
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completionHandler(.failure(.invalidUsername))
                return
            }
            
            // check data exists
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            // handle data
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(.success(followers))
            } catch {
                completionHandler(.failure(.invalidDecode))
                return
            }
        }
        task.resume()
    }
    
    
}




// MARK: - The original get followers method that does not use the Result type
/*
 func getFollowers(for username: String, page: Int, completionHandler: @escaping ([Follower]?, GFError?) -> Void) {
         let urlString = baseURL + "/users/\(username)/followers?per_page=\(perPage)&page=\(page)"
         
         guard let url = URL(string: urlString) else {
             completionHandler(nil, .invalidUsername)
             return
         }
         
         let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
             // check error
             if let _ = error {
                 completionHandler(nil, .unableToComplete)
                 return
             }
             
             // check response
             guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                 completionHandler(nil, .invalidResponse)
                 return
             }
             
             // check data exists
             guard let data = data else {
                 completionHandler(nil, .invalidData)
                 return
             }
             
             // handle data
             do {
                 let decoder = JSONDecoder()
 //                decoder.keyDecodingStrategy = .convertFromSnakeCase
                 let followers = try decoder.decode([Follower].self, from: data)
                 completionHandler(followers, nil)
             } catch {
                 completionHandler(nil, .invalidDecode)
                 return
             }
         }
         task.resume()
     }
 */
