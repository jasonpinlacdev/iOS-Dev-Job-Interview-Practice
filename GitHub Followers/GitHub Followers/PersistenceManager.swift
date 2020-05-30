//
//  PersistenceManager.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/29/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

enum PersistenceActionType {
    case add
    case remove
}


enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completionHandler: @escaping (GFError?) -> Void) {
        retrieveFavorites { result in
            
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else { completionHandler(.alreadyFavoritedError); return}
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completionHandler(save(favorites: favorites))
                
            case .failure(let error):
                completionHandler(error)
            }
        }
    }
    
    
    
    private static func retrieveFavorites(completionHandler: @escaping (Result<[Follower], GFError>) -> Void) {
        // get favorites data
        guard let favoritesData = defaults.object(forKey: "Favorites") as? Data else {
            // if data doesnt exist return an empty array of type follower
            completionHandler(.success([Follower]()))
            return
        }
        
        // with favorites data retrieved now we need to decode it into a [Follower] array
        do {
            let favorites = try JSONDecoder().decode([Follower].self, from: favoritesData)
            completionHandler(.success(favorites))
        } catch {
            completionHandler(.failure(.unableToFavoriteError))
        }
    }
    
    
    private static func save(favorites: [Follower]) -> GFError? {
        do {
            let encodedFavorites = try JSONEncoder().encode(favorites)
            defaults.set(encodedFavorites, forKey: "Favorites")
            return nil
        } catch {
            return .unableToFavoriteError
        }
    }
    
}
