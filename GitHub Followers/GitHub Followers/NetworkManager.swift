//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/11/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let baseURL = "https://api.github.com"
    private let perPage = 100
    
    func getFollowers(username: String, page: Int, completionHandler: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.usernameError))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.clientError))
                return
            }
            
            // check reponse
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(.failure(.serverError))
                return
            }
            
            // check data
            guard let data = data else {
                completionHandler(.failure(.dataError))
                return
            }
            
            // handle data
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                completionHandler(.success(followers))
            } catch {
                completionHandler(.failure(.decodeError))
            }
        }
        
        task.resume()
    }

}





/*
// 1st iteration of getFollowers before the error refactor
func getFollowers(username: String, page: Int, completionHandler: @escaping ([Follower]?, String?) -> Void) {
       let endpoint = baseURL + "/users/\(username)/followers?page=\(page)&per_page=\(perPage)"
       
       guard let url = URL(string: endpoint) else {
           completionHandler(nil, "This username created an invalid request. Please try again.")
           return
       }
       
       let task = URLSession.shared.dataTask(with: url) { data, response, error in
           if let _ = error {
               completionHandler(nil, "Unable to handle your request. Check your internet connection.")
               return
           }
           
           // check reponse
           guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
               completionHandler(nil, "Invalid response from the server. Please try again.")
               return
           }
           
           // check data
           guard let data = data else {
               completionHandler(nil, "The data received from the server is invalid. Please try again.")
               return
           }
           
           // handle data
           do {
               let followers = try JSONDecoder().decode([Follower].self, from: data)
               completionHandler(followers, nil)
           } catch {
               completionHandler(nil, "The data failed to decode correctly. Please try again.")
           }
       }
       
       task.resume()
   }
 
 // get followers 2nd iteration after the error refactor
 func getFollowers(username: String, page: Int, completionHandler: @escaping ([Follower]?, GFError?) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(nil, .usernameError)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completionHandler(nil, .clientError)
                return
            }
            
            // check reponse
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil, .serverError)
                return
            }
            
            // check data
            guard let data = data else {
                completionHandler(nil, .dataError)
                return
            }
            
            // handle data
            do {
                let followers = try JSONDecoder().decode([Follower].self, from: data)
                completionHandler(followers, nil)
            } catch {
                completionHandler(nil, .decodeError)
            }
        }
        
        task.resume()
    }
 */
