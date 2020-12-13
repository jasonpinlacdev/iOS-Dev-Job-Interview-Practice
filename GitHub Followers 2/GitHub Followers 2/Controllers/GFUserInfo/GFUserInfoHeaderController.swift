//
//  GFUserInfoHeaderController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

// The benefit of the child view controller vs the view is that you get access to all the life cycle methods. Can self contain the logic to drive the data and UI. Flexibility when presenting. Reusability.

class GFUserInfoHeaderController: UIViewController {
    
    let user: GFUser
    
    let avatarImageView = GFAvatarImageView()
    lazy var loginLabel = GFSecondaryTitleLabel(fontSize: 34, text: user.login)
    let nameLabel = UILabel()
    let locationPinImageView = UIImageView(image: GFImage.mappinAndEllipse)
    let locationLabel = UILabel()
    lazy var bioLabel = GFBodyLabel(text: user.bio ?? "Biography Unavailable")
    
    init(user: GFUser) {
        self.user = user;
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
    }
    
    private func configure() {
        GFNetworkManager.shared.getAvatarImage(urlString: user.avatarURL, completionHandler: { [weak self] result in
            switch result {
            case .success(let image):
                self?.avatarImageView.image = image
            case .failure:
                break
            }
        })
        loginLabel.textColor = .label
        nameLabel.text = user.name ?? "Name Unavailable"
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        nameLabel.textColor = .label
        locationLabel.text = user.location ?? "Location Unavailable"
        locationLabel.font = UIFont.systemFont(ofSize: 18)
        locationLabel.textColor = .label
        bioLabel.textColor = .label
        bioLabel.textAlignment = .left
    }
    
    private func layoutUI() {
        view.addSubview(avatarImageView)
        view.addSubview(loginLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationPinImageView)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationPinImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 10.0
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: view.topAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            loginLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginLabel.heightAnchor.constraint(equalToConstant: 36),
            
            nameLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: padding),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            locationPinImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            locationPinImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            locationPinImageView.widthAnchor.constraint(equalToConstant: 20.0),
            locationPinImageView.heightAnchor.constraint(equalTo: locationPinImageView.widthAnchor),
            
            locationLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: padding),
            locationLabel.leadingAnchor.constraint(equalTo: locationPinImageView.trailingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20.0),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: padding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
}
