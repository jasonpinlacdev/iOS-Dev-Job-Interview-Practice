//
//  GFRepoInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/23/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

protocol GFRepoInfoItemViewControllerDelegate: class {
    func didTapGitHubProfiles(for user: User)
}


class GFRepoInfoItemViewController: GFItemInfoViewController {
    
    weak var delegate: GFRepoInfoItemViewControllerDelegate!

    
    init(user: User, delegate: GFRepoInfoItemViewControllerDelegate) {
        self.delegate = delegate
        super.init(user: user)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    // MARK: - Private Section -
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(title: "GitHub Profile" , color:.systemPurple)
        actionButton.addTarget(self, action: #selector(actionButtonTapped(_:)), for: .touchUpInside)
    }
    
    
    @objc func actionButtonTapped(_ sender: GFButton) {
        delegate?.didTapGitHubProfiles(for: user)
    }
}

