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
        itemInfoViewOne.set(itemInfoType: .repos, for: user)
        itemInfoViewTwo.set(itemInfoType: .gists, for: user)
        actionButton.setTitle("GitHub Profile", for: .normal)
        actionButton.backgroundColor = .systemPurple
    }
}

