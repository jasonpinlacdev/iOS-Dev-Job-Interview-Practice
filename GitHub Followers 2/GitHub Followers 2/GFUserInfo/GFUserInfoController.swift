//
//  GFUserInfoController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

class GFUserInfoController: UIViewController {
    
    let user: GFUser
    
    init(user: GFUser) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var headerViewController = GFUserInfoHeaderController(avatarURL: user.avatarURL, login: user.login, name: user.name, location: user.location, bio: user.bio)
    
    lazy var topItemController = GFUserInfoItemController(leftItemView: GFUserInfoItemView(iconName: "folder", title: "Public Repos", count: user.publicRepos), rightItemView: GFUserInfoItemView(iconName: "text.alignleft", title: "Public Gists", count: user.publicGists), actionButtonTitle: "GitHub Profile", actionButtonColor: UIColor.systemPurple)
    
    lazy var bottomItemController = GFUserInfoItemController(leftItemView: GFUserInfoItemView(iconName: "heart", title: "Following", count: user.following), rightItemView: GFUserInfoItemView(iconName: "person.2", title: "Followers", count: user.followers), actionButtonTitle: "Get Followers", actionButtonColor: UIColor.systemGreen)
    
    lazy var dateCreatedLabel: UILabel = {
        let dateCreatedLabel = UILabel()
        dateCreatedLabel.text = user.createdAt
        dateCreatedLabel.textAlignment = .center
        dateCreatedLabel.font = UIFont.preferredFont(forTextStyle: .body)
        dateCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateCreatedLabel
    }()
    
    lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .fillEqually
        verticalStackView.alignment = .fill
        verticalStackView.spacing = 10.0
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(headerViewController.view)
        verticalStackView.addArrangedSubview(topItemController.view)
        verticalStackView.addArrangedSubview(bottomItemController.view)
        return verticalStackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    private func layoutUI() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneTappedToDismissController))
        
        view.addSubview(verticalStackView)
        view.addSubview(dateCreatedLabel)
        
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0),
            verticalStackView.bottomAnchor.constraint(equalTo: dateCreatedLabel.topAnchor, constant: -10.0),
            
            dateCreatedLabel.heightAnchor.constraint(equalToConstant: 20.0),
            dateCreatedLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            dateCreatedLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            dateCreatedLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    @objc func doneTappedToDismissController() {
        self.dismiss(animated: true)
    }
    

}

