//
//  GFPersistenceManager.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/30/21.
//

import UIKit


class GFPersistenceManager {
  static let shared = GFPersistenceManager()
  
  private var favoriteUsers: [String] = []
  private var documentDirectoryURL: URL { return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] }
  
  private init() {}
  

  
  func printFavoriteUsers() {
    print("Favorite Users: \(favoriteUsers)")
  }
  
  func isInFavorites(_ username: String) -> Bool {
    return self.favoriteUsers.contains { $0.lowercased() == username.lowercased() }
  }

  func addToFavorites(_ username: String, completionHandler: (() -> Void)? = nil) {
    if isInFavorites(username.lowercased()) { return }
    self.favoriteUsers.append(username.lowercased())
    saveFavorites()
    completionHandler?()
  }
  
  func removeFromFavorites(_ username: String, completionHandler: (() -> Void)? = nil) {
    let indexFound = self.favoriteUsers.firstIndex { $0.lowercased() == username.lowercased() }
    if let indexFound = indexFound {
      self.favoriteUsers.remove(at: indexFound)
      saveFavorites()
      completionHandler?()
    }
  }
  
  private func saveFavorites() {
    let favoriteUsersURL = URL(fileURLWithPath: "UserFavorites.txt", relativeTo: documentDirectoryURL)
    let favoriteUsersSerialized = try? JSONEncoder().encode(self.favoriteUsers)
    try? favoriteUsersSerialized?.write(to: favoriteUsersURL)
  }
  
  func loadFavorites() {
    guard FileManager.default.fileExists(atPath: self.documentDirectoryURL.appendingPathComponent("UserFavorites.txt").path) else { return }
    let favoriteUsersURL = URL(fileURLWithPath: "UserFavorites.txt", relativeTo: self.documentDirectoryURL)
    guard let favoriteUsersData = try? Data(contentsOf: favoriteUsersURL) else { return }
    guard let favoriteUsersDecoded = try? JSONDecoder().decode([String].self, from: favoriteUsersData) else { return }
    self.favoriteUsers = favoriteUsersDecoded
  }
  

  
}
