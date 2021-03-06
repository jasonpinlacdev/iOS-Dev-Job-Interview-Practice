//
//  GFUserInfoController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit
import SafariServices

protocol GFUserInfoControllerDelegate {
    func getFollowersTapped(username: String, followers: [GFFollower])
}

class GFUserInfoController: UIViewController {
    
    let user: GFUser
    var isUserFavorited = false
    
    let headerContainerView = UIView()
    let topItemContainerView = UIView()
    let bottomItemContainerView = UIView()
    var containerViews = [UIView]()
    
    var delegate: GFUserInfoControllerDelegate?
    
    init(user: GFUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerViewController = GFUserInfoHeaderController(user: self.user)
    lazy var topItemViewController = GFUserInfoItemController(leftItemView: GFUserInfoItemView(iconName: "folder", title: "Public Repos", count: user.publicRepos), rightItemView: GFUserInfoItemView(iconName: "text.alignleft", title: "Public Gists", count: user.publicGists), actionButtonTitle: "GitHub Profile", actionButtonColor: UIColor.systemPurple)
    lazy var bottomItemViewController = GFUserInfoItemController(leftItemView: GFUserInfoItemView(iconName: "heart", title: "Following", count: user.following), rightItemView: GFUserInfoItemView(iconName: "person.2", title: "Followers", count: user.followers), actionButtonTitle: "Get Followers", actionButtonColor: UIColor.systemGreen)
    
    let dateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func configure() {
        view.backgroundColor = .systemBackground
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTappedToDismissController))
        
        GFPersistenceManager.shared.retrieveFavorites { [weak self] result in
            switch result {
            case .success(let favorites):
                self?.isUserFavorited = favorites.contains(where: {$0.login == user.login})
            case .failure(let error):
                self?.isUserFavorited = false
                presentAlert(alertTitle: "Favorites Error", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
            }
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: isUserFavorited ? GFImage.starFill : GFImage.star, style: .plain, target: self, action: #selector(starButtonTapped))
        
        let formattedDateCreatedAt = user.createdAt.convertedToDateObject?.convertedMonthYearFormat
        dateLabel.text = "GitHub since \(formattedDateCreatedAt ?? "Unknown")"
        dateLabel.textAlignment = .center
        dateLabel.textColor = .label
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        
        topItemViewController.actionButton.addTarget(self, action: #selector(gitHubProfileButtonTapped), for: .touchUpInside)
        bottomItemViewController.actionButton.addTarget(self, action: #selector(getFollowersButtonTapped), for: .touchUpInside)
    }
    
    private func layoutUI() {
        containerViews = [headerContainerView, topItemContainerView, bottomItemContainerView, dateLabel]
        containerViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        add(childViewController: headerViewController, to: headerContainerView)
        add(childViewController: topItemViewController, to: topItemContainerView)
        add(childViewController: bottomItemViewController, to: bottomItemContainerView)
        
        let padding: CGFloat = 10.0
        NSLayoutConstraint.activate([
            headerContainerView.heightAnchor.constraint(equalToConstant: 200),
            headerContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            headerContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding * 1.5),
            headerContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding * 1.5),
            
            topItemContainerView.heightAnchor.constraint(equalToConstant: 140),
            topItemContainerView.topAnchor.constraint(equalTo: headerContainerView.bottomAnchor, constant: padding),
            topItemContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            topItemContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            bottomItemContainerView.heightAnchor.constraint(equalToConstant: 140),
            bottomItemContainerView.topAnchor.constraint(equalTo: topItemContainerView.bottomAnchor, constant: padding),
            bottomItemContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bottomItemContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            dateLabel.heightAnchor.constraint(equalToConstant: 18),
            dateLabel.topAnchor.constraint(equalTo: bottomItemContainerView.bottomAnchor, constant: padding),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            dateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }
    
    private func add(childViewController: UIViewController, to containerView: UIView) {
        self.addChild(childViewController)
        childViewController.view.frame = containerView.bounds
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    @objc func doneTappedToDismissController() {
        if self.presentingViewController == nil {
            navigationController?.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
    }
    
    @objc func gitHubProfileButtonTapped() {
        guard let url = URL(string: user.htmlURL) else { return }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
    
    @objc func getFollowersButtonTapped() {
        let loadingViewController = GFLoadingViewController()
        present(loadingViewController, animated: true)
        
        GFNetworkManager.shared.getFollowers(for: user.login, page: 1, completionHandler: { [weak self] result in
            switch result {
            case .success(let followers):
                DispatchQueue.main.async {
                    loadingViewController.dismiss(animated: true, completion: {
                        self?.dismiss(animated: true, completion: {
                            self?.delegate?.getFollowersTapped(username: (self?.user.login)!, followers: followers)
                        })
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    loadingViewController.dismiss(animated: true, completion: {
                        self?.presentAlert(alertTitle: "Something Went Wrong", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                    })
                }
            }
        })
    }
    
    @objc func starButtonTapped() {
        switch isUserFavorited {
        case true:
            isUserFavorited = false
            navigationItem.rightBarButtonItem?.image = GFImage.star
            GFPersistenceManager.shared.updateFavoritesWith(user: user, typeOfUpdate: .remove, completionHandler: { error in
                if let error = error {
                    presentAlert(alertTitle: "Favorites Error", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                    navigationItem.rightBarButtonItem?.image = GFImage.starFill
                }
            })
        case false:
            isUserFavorited = true
            navigationItem.rightBarButtonItem?.image = GFImage.starFill
            GFPersistenceManager.shared.updateFavoritesWith(user: user, typeOfUpdate: .add, completionHandler: { error in
                if let error = error {
                    presentAlert(alertTitle: "Favorites Error", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                    navigationItem.rightBarButtonItem?.image = GFImage.starFill
                }
            })
        }
    }
}

