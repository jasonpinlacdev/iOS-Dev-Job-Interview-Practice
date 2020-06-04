//
//  UserInfoViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/21/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

protocol UserInfoViewControllerDelegate: class {
    func didRequestFollowers(for username: String)
}


class UserInfoViewController: GFDataLoadingViewController {
    
    var username: String!
    weak var delegate: UserInfoViewControllerDelegate?
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    let headerContainerView = UIView()
    let itemOneContainerView = UIView()
    let itemTwoContainerView = UIView()
    var dateLabel = GFBodyLabel(textAlignment: .center)
    var itemViews: [UIView] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureScrollView()
        layoutUI()
        getUser()
    }
    
    
    func getUser() {
        showLoadingView()
        NetworkManager.shared.getUser(username: username) { result in
            self.dismissLoadingView()
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self.configureUIElements(user: user)
                }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something bad happened", message: error.rawValue, buttonTitle: "Dismiss")
            }
        }
    }
    
    
    // MARK: - Private Section -
    
    
    private func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }
    
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.pinToEdges(of: view)
        scrollView.addSubview(contentView)
        contentView.pinToEdges(of: scrollView)
        
        // quirk of the content view. it needs more than 4 anchor constraints to satisfy its autolayout. an explicit width and height of how much area you can scroll

        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 500),
        ])
    }
    
    
    private func layoutUI() {
        let padding: CGFloat = 20
        let itemHeight: CGFloat = 140
        
        itemViews = [headerContainerView, itemOneContainerView, itemTwoContainerView, dateLabel]
        
        for view in itemViews {
            view.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(view)
            NSLayoutConstraint.activate([
                view.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                view.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
            ])
        }
        
        NSLayoutConstraint.activate([
            headerContainerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            headerContainerView.heightAnchor.constraint(equalToConstant: 200),
            itemOneContainerView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: padding),
            itemOneContainerView.heightAnchor.constraint(equalToConstant: itemHeight),
            itemTwoContainerView.topAnchor.constraint(equalTo: itemOneContainerView.bottomAnchor, constant: padding),
            itemTwoContainerView.heightAnchor.constraint(equalToConstant: itemHeight),
            dateLabel.topAnchor.constraint(equalTo: itemTwoContainerView.bottomAnchor, constant: 10),
            dateLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    
    private func configureUIElements(user: User) {
        //        let gfRepoInfoItemViewController = GFRepoInfoItemViewController(user: user)
        //        gfRepoInfoItemViewController.delegate = self
        
        //        let gfFollowerItemInfoViewController = GFFollowerItemInfoViewController(user: user)
        //        gfFollowerItemInfoViewController.delegate = self
        
        self.add(childViewController: GFHeaderInfoViewController(user: user), to: self.headerContainerView)
        self.add(childViewController: GFRepoInfoItemViewController(user: user, delegate: self), to: self.itemOneContainerView)
        self.add(childViewController: GFFollowerItemInfoViewController(user: user, delegate: self), to: self.itemTwoContainerView)
        let dateString = user.createdAt.convertToMMMdYYYYStringFormat()
        self.dateLabel.text = "GitHub since \(dateString)"
    }
    
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        containerView.addSubview(childViewController.view)
        self.addChild(childViewController)
        childViewController.didMove(toParent: self)
        childViewController.view.frame = containerView.bounds
    }
    
    
    @objc func doneButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}


extension UserInfoViewController: GFRepoInfoItemViewControllerDelegate {
    
    func didTapGitHubProfiles(for user: User) {
        guard let url = URL(string: user.htmlURL) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The url for this user is invalid.", buttonTitle: "Dismiss")
            return
        }
        presentSafariViewController(with: url)
    }
}


extension UserInfoViewController: GFFollowerItemInfoViewControllerDelegate {
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers. What a shame 😔.", buttonTitle: "Dismiss")
            return
        }
        delegate?.didRequestFollowers(for: user.login)
        dismiss(animated: true)
    }
}





