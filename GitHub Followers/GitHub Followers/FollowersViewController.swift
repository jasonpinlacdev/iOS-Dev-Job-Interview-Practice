//
//  FollowersViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/30/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
    var username: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        NetworkManager.shared.getFollowers(username: username, page: 1) { result in
            switch result {
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
            case .success(let followers):
                print(followers)
            }
        }
        
        
    }

    
}


/*
 // before the Result type refactor
 NetworkManager.shared.getFollowers(username: username, page: 1) { followers, error in
     if let error = error {
         self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Dismiss")
         return
     }
     
     print(followers)
 }
 
 */
