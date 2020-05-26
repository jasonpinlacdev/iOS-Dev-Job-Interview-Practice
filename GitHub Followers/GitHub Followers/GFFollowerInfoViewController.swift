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
        itemInfoViewOne.set(itemInfoType: .following, withCount: user.following)
        itemInfoViewTwo.set(itemInfoType: .followers, withCount: user.followers)
        actionButton.set(title: "Get Followers" , color: .systemGreen)
     }
}
