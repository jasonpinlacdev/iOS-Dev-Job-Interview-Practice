//
//  GFNetworkManager.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/27/20.
//

import Foundation


class GFNetworkManager {
    
    static let shared = GFNetworkManager()
    
    private let session = URLSession.shared
    private let baseURL = "https://api.github.com"
    
    private init() { }
    
    func getUser(for username: String, completionHandler: @escaping (Result<GFUser, GFError>) -> Void ) {
        let endpoint = baseURL + "/users/\(username)"
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.URLError))
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
           
            guard error == nil else {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard response.mimeType == ResponseMIMEType.applicationJSON.rawValue else {
                completionHandler(.failure(.MIMEError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.dataError))
                return
            }
            
            do {
                let user = try JSONDecoder().decode(GFUser.self, from: data)
                completionHandler(.success(user))
            } catch {
                completionHandler(.failure(.decodeError))
            }
        }
        task.resume()
    }
    
    // @escaping means the closure will outlive the function scope its being invoked from.
    func getFollowers(for username: String, page: Int, completionHandler: @escaping (Result<[GFFollower], GFError>) -> Void ) {
        let endpoint = baseURL + "/users/\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completionHandler(.failure(.URLError))
            return
        }
        
        // task is async and runs on a background thread
        let task = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completionHandler(.failure(.clientError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                completionHandler(.failure(.serverError))
                return
            }
            
            guard response.mimeType == ResponseMIMEType.applicationJSON.rawValue else {
                completionHandler(.failure(.MIMEError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.dataError))
                return
            }
            
            do {
                let followers = try JSONDecoder().decode([GFFollower].self, from: data)
                completionHandler(.success(followers))
            } catch {
                completionHandler(.failure(.decodeError))
            }
        }
        task.resume()
    }
    
    
    
}
