//
//  SceneDelegate.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/30/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

  var window: UIWindow?


  func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    guard let windowScene = (scene as? UIWindowScene) else { return }
    self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
    self.window?.windowScene = windowScene
    self.window?.rootViewController = createRootViewController()
    self.window?.makeKeyAndVisible()
    GFPersistenceManager.shared.loadFavorites()
  }

  func sceneDidDisconnect(_ scene: UIScene) {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
  }

  func sceneDidBecomeActive(_ scene: UIScene) {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
  }

  func sceneWillResignActive(_ scene: UIScene) {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
  }

  func sceneWillEnterForeground(_ scene: UIScene) {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
  }

  func sceneDidEnterBackground(_ scene: UIScene) {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
  }


}



// MARK: - Scene Delegate Extension to configure rootViewController for application -
extension SceneDelegate {
  func createRootViewController() -> UITabBarController {
    configureAppearancesForTabBarAndNavigationBar()
    let rootTabBarController = UITabBarController()
    rootTabBarController.viewControllers = [createSearchController(), createFavoritesController()]
    return rootTabBarController
  }
  
  func createSearchController() -> UINavigationController {
    let searchController = GFSearchController()
    searchController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
    return UINavigationController(rootViewController: searchController)
  }
  
  func createFavoritesController() -> UINavigationController {
    let favoritesController = GFFavoritesController()
    favoritesController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
    return UINavigationController(rootViewController: favoritesController)
  }
  
  func configureAppearancesForTabBarAndNavigationBar() {
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

