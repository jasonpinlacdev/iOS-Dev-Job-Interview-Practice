//
//  NetworkManager.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/11/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()
    
    private let apiToken = "656badfe5bd279b3947e11f502d350ca6d01a7ef"
    private let baseURL = "https://api.github.com"
    private let perPage = 100
    
    private let avatarImageCache = NSCache<NSString, UIImage>()
    
    func getFollowers(username: String, page: Int, completionHandler: @escaping (Result<[Follower], GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)/followers?page=\(page)&per_page=\(perPage)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.usernameError))
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("token \(apiToken)", forHTTPHeaderField: "Authorization")

        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            // check error
            if let _ = error {
                completionHandler(.failure(.clientError))
                return
            }
            
            
//            if let r = response as? HTTPURLResponse {
//                print(r)
//
//            }
            // check reponse
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode)  else {
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
    
    
    func getAvatarImage(from urlString: String, completionHandler: @escaping (UIImage?) -> Void){
        // check cache
        let cacheKey = NSString(string: urlString)
        if let image = avatarImageCache.object(forKey: cacheKey) {
            completionHandler(image)
            return
        }
        
        // download image if not in cache
        guard let url = URL(string: urlString) else {
            completionHandler(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("token \(apiToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                completionHandler(nil)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completionHandler(nil)
                return
            }
            guard let data = data else {
                completionHandler(nil)
                return
            }
            guard let image = UIImage(data: data) else {
                completionHandler(nil)
                return
            }
            // store in cache
            self.avatarImageCache.setObject(image, forKey: cacheKey)
            completionHandler(image)
        }
        task.resume()
    }
    
    
    func getUser(username: String, completionHandler: @escaping (Result<User, GFError>) -> Void) {
        let endpoint = baseURL + "/users/\(username)"
        
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.usernameError))
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("token \(apiToken)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let _ = error {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.dataError))
                return
            }
            
            do {
                let user = try JSONDecoder().decode(User.self, from: data)
                completionHandler(.success(user))
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



// How to call the network manager
/*
 // before the Result type refactor
 NetworkManager.shared.getFollowers(username: username, page: 1) { followers, error in
 if let error = error {
 self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
 return
 }
 
 print(followers)
 }
 
 // after the Result type
 NetworkManager.shared.getFollowers(username: username, page: 1) { result in
 switch result {
 case .failure(let error):
 self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
 case .success(let followers):
 print(followers)
 }
 }
 
 */
