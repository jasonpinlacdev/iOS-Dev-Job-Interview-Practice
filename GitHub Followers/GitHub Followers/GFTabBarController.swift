//
//  GFTabBarController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/31/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    // MARK: - Private Section - 
    
    
    private func configure() {
        self.tabBar.tintColor = UIColor.systemGreen
        self.viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    }
    
    
    private func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchViewController.title = "Search"
        searchViewController.view.backgroundColor = UIColor.systemBackground
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.navigationBar.prefersLargeTitles = true
        return searchNavController
        
    }
    
    
    private func createFavoritesNavigationController() -> UINavigationController {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoritesViewController.title = "Favorites"
        favoritesViewController.view.backgroundColor = UIColor.systemBackground
        let favoritesNavController = UINavigationController(rootViewController: favoritesViewController)
        favoritesNavController.navigationBar.prefersLargeTitles = true
        return favoritesNavController
    }
}
