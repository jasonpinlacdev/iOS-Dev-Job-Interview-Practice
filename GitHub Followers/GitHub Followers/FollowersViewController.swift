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
        navigationController?.isNavigationBarHidden = false
        navigationItem.largeTitleDisplayMode = .always
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

}
