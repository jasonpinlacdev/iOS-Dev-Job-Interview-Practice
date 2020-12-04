//
//  GFFavoritesCell.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 12/2/20.
//

import UIKit

class GFFavoritesCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: GFFavoritesCell.self)
    
    let avatarImageView = GFAvatarImageView()
    let loginLabel: UILabel = {
        let loginLabel = UILabel()
        loginLabel.textAlignment = .left
        loginLabel.font = UIFont.systemFont(ofSize: 28.0)
        loginLabel.textColor = .label
        loginLabel.adjustsFontSizeToFitWidth = true
        loginLabel.minimumScaleFactor = 0.75
        loginLabel.lineBreakMode = .byTruncatingTail
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        return loginLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setFavorite(user: GFUser) {
        loginLabel.text = user.login
        GFNetworkManager.shared.getAvatarImage(urlString: user.avatarURL, completionHandler: { [weak self] result in
            switch(result) {
            case .success(let image):
                DispatchQueue.main.async {
                    self?.avatarImageView.image = image
                }
            case .failure(let error):
                print(error)
            }
        })
    }
    
    private func layoutUI() {
        self.accessoryType = .disclosureIndicator
        addSubview(avatarImageView)
        addSubview(loginLabel)
        
        let padding: CGFloat = 12.0
        NSLayoutConstraint.activate([
            avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 75.0),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            loginLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
            loginLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
            loginLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            loginLabel.heightAnchor.constraint(equalToConstant: 32.0),
        ])
    }

}
