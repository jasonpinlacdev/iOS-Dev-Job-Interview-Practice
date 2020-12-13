//
//  GFTabBarController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 12/11/20.
//

import UIKit

class GFTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemGreen
        UINavigationBar.appearance().tintColor = .systemGreen
    
        let searchController = GFSearchController()
        searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let favoritesController = GFFavoritesController()
        favoritesController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

        let navigationControllers = [searchController, favoritesController].map { UINavigationController(rootViewController: $0) }
        setViewControllers(navigationControllers, animated: false)
    }
    

}
