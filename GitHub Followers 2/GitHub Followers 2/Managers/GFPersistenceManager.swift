//
//  GFPersistenceManager.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/25/20.
//

import UIKit


enum FavoriteUpdateType {
    case add
    case remove
}


class GFPersistenceManager {
    
    static let shared = GFPersistenceManager()
    
    private init() { }
    
    func updateFavoritesWith(user: GFUser, typeOfUpdate: FavoriteUpdateType, completionHandler: (GFError?) -> ()) {
        retrieveFavorites(completionHandler: { result in
            switch result {
            case .success(var favorites):
                switch typeOfUpdate {
                case .add:
                    guard !favorites.contains(where: {$0.login == user.login}) else {
                        completionHandler(.alreadyInFavoritesError)
                        return
                    }
                    favorites.append(user)
                    completionHandler(save(favorites: favorites))
                case .remove:
                    guard favorites.contains(where: {$0.login == user.login}) else {
                        completionHandler(.removeFavoriteError)
                        return
                    }
                    favorites.removeAll{ $0.login == user.login }
                    completionHandler(save(favorites: favorites))
                }
            case .failure(let error):
                completionHandler(error)
            }
        })
    }
    
    func retrieveFavorites(completionHandler: (Result<[GFUser], GFError>) -> ()) {
        let favoritesURL = URL(fileURLWithPath: "favorites.json", relativeTo: FileManager.documentDirectoryURL)
        guard FileManager.default.fileExists(atPath: favoritesURL.path) else {
            // We've never saved to favorites before. So here is where we create the save file for the very first time in our app's document directory.
            let emptyFavorites = [GFUser]()
            let emptyFavoritesData = try? JSONEncoder().encode(emptyFavorites)
            try? emptyFavoritesData?.write(to: favoritesURL, options: .atomicWrite)
            completionHandler(.success(emptyFavorites))
            return
        }
        
        do {
            let favoritesData = try Data(contentsOf: favoritesURL)
            let favorites = try JSONDecoder().decode([GFUser].self, from: favoritesData)
            completionHandler(.success(favorites))
        } catch {
            completionHandler(.failure(.retrieveFavoritesError))
        }
    }
    
    private func save(favorites: [GFUser]) -> GFError? {
        let favoritesURL = URL(fileURLWithPath: "favorites.json", relativeTo: FileManager.documentDirectoryURL)
        do {
            let favoritesData = try JSONEncoder().encode(favorites)
            try favoritesData.write(to: favoritesURL, options: .atomicWrite)
            return nil
        } catch {
            return .saveFavoritesError
        }
    }
    
    
}
