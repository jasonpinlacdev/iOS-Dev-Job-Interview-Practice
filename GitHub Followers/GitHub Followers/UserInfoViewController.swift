//
//  UserInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/21/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var username: String!
    
    let headerContainerView = UIView()
    let itemOneContainerView = UIView()
    let itemTwoContainerView = UIView()
    var itemViews: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
        getUser()
    }
    
    func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    func getUser() {
        NetworkManager.shared.getUser(username: username) { result in
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.add(childViewController: GFHeaderInfoViewController(user: user), to: self.headerContainerView)
                    self.add(childViewController: GFRepoInfoItemViewController(user: user), to: self.itemOneContainerView)
                    self.add(childViewController: GFFollowerItemInfoViewController(user: user), to: self.itemTwoContainerView)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something bad happened", message: error.rawValue, buttonTitle: "Dismiss")
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    
    func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerContainerView, itemOneContainerView, itemTwoContainerView]
        
        for view in itemViews {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: 180),
            itemOneContainerView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: padding),
            itemOneContainerView.heightAnchor.constraint(equalToConstant: itemHeight),
            itemTwoContainerView.topAnchor.constraint(equalTo: itemOneContainerView.bottomAnchor, constant: padding),
            itemTwoContainerView.heightAnchor.constraint(equalToConstant: itemHeight),
        ])
    }
    
    
    func add(childViewController: UIViewController, to containerView: UIView) {
        self.addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    
    @objc func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
