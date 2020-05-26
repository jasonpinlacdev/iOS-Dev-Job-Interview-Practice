//
//  GFRepoInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/23/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


class GFRepoInfoItemViewController: GFItemInfoViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    // MARK: - Private Section -
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(title: "GitHub Profile" , color:.systemPurple)
    }
}

