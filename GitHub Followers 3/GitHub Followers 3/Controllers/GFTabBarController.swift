//
//  GFTabBarController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 12/2/21.
//

import UIKit

class GFTabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureAppearancesForTabBarAndNavigationBar()
    self.viewControllers = [createGFSearchController(), createGFFavoritesController()]
    GFPersistenceManager.shared.loadFavorites()
  }
  
  
  private func createGFSearchController() -> UINavigationController {
    let searchController = GFSearchController()
    searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    return UINavigationController(rootViewController: searchController)
  }
  
  
  private func createGFFavoritesController() -> UINavigationController {
    let favoritesController = GFFavoritesController()
    favoritesController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    return UINavigationController(rootViewController: favoritesController)
  }
  
  
  private func configureAppearancesForTabBarAndNavigationBar() {
    
    // Here we set the UITabBar appearance using the app-wide proxy
    let tabBarAppearance = UITabBarAppearance()
    tabBarAppearance.backgroundColor = .systemBackground
//    tabBarAppearance.shadowColor = .systemBackground
    UITabBar.appearance().standardAppearance = tabBarAppearance
    UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    UITabBar.appearance().tintColor = .systemGreen
    
    // Here we set the UINavigationBar appearance using the app-wide proxy
    let navigationBarAppearance = UINavigationBarAppearance()
    navigationBarAppearance.backgroundColor = .systemBackground
//    navigationBarAppearance.shadowColor = .systemBackground
    UINavigationBar.appearance().standardAppearance = navigationBarAppearance
    UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactAppearance = navigationBarAppearance
    UINavigationBar.appearance().compactScrollEdgeAppearance = navigationBarAppearance
    UINavigationBar.appearance().tintColor = .systemGreen
    UINavigationBar.appearance().prefersLargeTitles = true
  }
  
}
