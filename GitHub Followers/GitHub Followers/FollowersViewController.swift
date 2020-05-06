//
//  FollowersViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/30/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {
    
    var userName: String!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemBackground
        navigationItem.largeTitleDisplayMode = .always
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        NetworkManager.shared.getFollowers(for: userName, page: 1) { result in
                   switch result {
                   case .failure(let error):
                       self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
                   case .success(let followers):
                       print(followers)
                   }
               }
        
//        NetworkManager.shared.getFollowers(for: userName, page: 1) { followers, error in
//            guard let followers = followers else {
//                self.presentGFAlertOnMainThread(title: "Something Went Wrong", message: error!.rawValue, buttonTitle: "Ok")
//                return
//            }
//            print(followers)
//        }
    }

}
