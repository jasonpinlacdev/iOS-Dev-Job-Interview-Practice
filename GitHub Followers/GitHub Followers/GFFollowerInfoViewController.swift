//
//  GFFollowerInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/23/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

protocol GFFollowerItemInfoViewControllerDelegate: class {
    func didTapGetFollowers(for user: User)
}


class GFFollowerItemInfoViewController: GFItemInfoViewController {
        
    weak var delegate: GFFollowerItemInfoViewControllerDelegate?
    

    override func viewDidLoad() {
         super.viewDidLoad()
         configureItems()
     }

    
     // MARK: - Private Section -
    
    
     private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .following, withCount: user.following)
        itemInfoViewTwo.set(itemInfoType: .followers, withCount: user.followers)
        actionButton.set(title: "Get Followers" , color: .systemGreen)
        actionButton.addTarget(self, action: #selector(actionbuttonTapped(_:)), for: .touchUpInside)
     }
    
    
    @objc func actionbuttonTapped(_ sender: GFButton) {
        delegate?.didTapGetFollowers(for: user)
    }
    
    
}


