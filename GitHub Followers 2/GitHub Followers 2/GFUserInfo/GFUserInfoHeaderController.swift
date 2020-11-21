//
//  GFUserInfoHeaderController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

// The benefit of the child view controller vs the view is that you get access to all the life cycle methods. Can self contain the logic to drive the data and UI. Flexibility when presenting. Reusability.

class GFUserInfoHeaderController: UIViewController {

    let avatarURL: String
    let login: String
    let name: String?
    let location: String?
    let bio: String?
    
    init(avatarURL: String, login: String, name: String?, location: String?, bio: String?) {
        self.avatarURL = avatarURL
        self.login = login
        self.name = name
        self.location = location
        self.bio = bio
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var avatarImageView: GFAvatarImageView = {
        let avatarImageView = GFAvatarImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        GFNetworkManager.shared.getAvatarImage(urlString: avatarURL, completionHandler: { result in
            switch result {
            case .success(let image):
                avatarImageView.image = image
            case .failure(let error):
                break
            }
        })
        return avatarImageView
    }()
    
    lazy var loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.text = login
        return loginLabel
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = name ?? "Name Unavailable"
        return nameLabel
    }()
    
    lazy var locationPinImageView: UIImageView = {
        let locationPinImageView = UIImageView(image: UIImage(systemName: "mappin.and.ellipse"))
        locationPinImageView.contentMode = .scaleAspectFit
        return locationPinImageView
    }()
    
    lazy var locationLabel: UILabel = {
        let locationLabel = UILabel()
        locationLabel.text = location ?? "Location Unavailable"
        locationLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return locationLabel
    }()
    
    lazy var bioLabel: UILabel = {
        let bioLabel = UILabel()
        bioLabel.text = bio ?? "Biography Unavailable"
        return bioLabel
    }()
    
    lazy var topHorizontalStack: UIStackView = {
        let topHorizontalStack = UIStackView()
        topHorizontalStack.axis = .horizontal
        topHorizontalStack.distribution = .fill
        topHorizontalStack.alignment = .fill
        topHorizontalStack.addArrangedSubview(avatarImageView)
        topHorizontalStack.addArrangedSubview(insideVerticalStack)
        return topHorizontalStack
    }()
    
    lazy var insideVerticalStack: UIStackView = {
        let insideVerticalStack = UIStackView()
        insideVerticalStack.axis = .vertical
        insideVerticalStack.distribution = .fillEqually
        insideVerticalStack.alignment = .fill
        insideVerticalStack.addArrangedSubview(loginLabel)
        insideVerticalStack.addArrangedSubview(nameLabel)
        
        
        let insideHorizontalStackView: UIStackView = {
           let insideHorizontalStackView = UIStackView()
            insideHorizontalStackView.axis = .horizontal
            insideHorizontalStackView.distribution = .fill
            insideHorizontalStackView.alignment = .fill
            insideVerticalStack.addArrangedSubview(locationPinImageView)
            insideHorizontalStackView.addArrangedSubview(locationLabel)
            return insideHorizontalStackView
        }()
        
        
        insideVerticalStack.addArrangedSubview(insideHorizontalStackView)
        return insideVerticalStack
    }()
    
    lazy var outsideVerticalStack: UIStackView = {
        let outsideVerticalStack = UIStackView()
        outsideVerticalStack.axis = .vertical
        outsideVerticalStack.distribution = .fill
        outsideVerticalStack.alignment = .fill
        outsideVerticalStack.isLayoutMarginsRelativeArrangement = true
        outsideVerticalStack.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        outsideVerticalStack.translatesAutoresizingMaskIntoConstraints = false
        outsideVerticalStack.addArrangedSubview(topHorizontalStack)
        outsideVerticalStack.addArrangedSubview(insideVerticalStack)
        return outsideVerticalStack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    private func layoutUI() {
        view.addSubview(outsideVerticalStack)
        view.backgroundColor = UIColor.secondarySystemBackground
        view.layer.cornerRadius = 16.0
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            outsideVerticalStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            outsideVerticalStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            outsideVerticalStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            outsideVerticalStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
}
