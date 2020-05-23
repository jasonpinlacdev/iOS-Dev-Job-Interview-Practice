//
//  GFFollowerInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/23/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFFollowerItemInfoViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
         super.viewDidLoad()
         configureItems()
     }
     
     // MARK: - Private Section -
     
     private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .following, for: user)
        itemInfoViewTwo.set(itemInfoType: .followers, for: user)
        actionButton.setTitle("Get Followers", for: .normal)
        actionButton.backgroundColor = UIColor.systemGreen
     }
}
