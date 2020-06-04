//
//  GFInfoHeaderViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/21/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFHeaderInfoViewController: UIViewController {
    
    var avatarImageView = GFAvatarImageView(frame: .zero)
    var usernameLabel = GFTitleLabel(textAlignment: .left, size: 34)
    var realNameLabel = GFSecondaryTitleLabel(fontSize: 18)
    var locationImageView = UIImageView()
    var locationLabel = GFSecondaryTitleLabel(fontSize: 18)
    var bioLabel = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    let mapPin = ""
    
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configureUIElements()
    }
    
    
    // MARK: - Private Section -
    

    private func layoutUI() {
        let padding: CGFloat = 20
        let imagePadding: CGFloat = 12
        
        view.addSubViews(avatarImageView, usernameLabel, realNameLabel, locationImageView, locationLabel, bioLabel)
        
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90.0),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90.0),
            
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: imagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            
            realNameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            realNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: imagePadding),
            realNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            realNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: imagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: imagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioLabel.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    
    private func configureUIElements() {
        NetworkManager.shared.getAvatarImage(from: user.avatarURL) { image in
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
        usernameLabel.text = user.login
        realNameLabel.text = user.name ?? "Name not available"
        locationLabel.text = user.location ?? "Location not available"
        locationImageView.image = SFSymbolsImages.location
        locationImageView.tintColor = .secondaryLabel
        bioLabel.text = user.bio ?? " Biography not available."
        bioLabel.numberOfLines = 3
    }
    
}
