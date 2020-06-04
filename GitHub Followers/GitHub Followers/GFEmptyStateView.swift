//
//  GFEmptyStateView.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/19/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let logoImageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUIElements()
        layoutUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    
    // MARK: - Private Section -
    
    
    private func configureUIElements() {
        addSubViews(messageLabel, logoImageView)
        
        messageLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        messageLabel.numberOfLines = 3
        
        logoImageView.image = Images.emptyStateLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    private func layoutUI() {
        let centerYAnchorConstraintConstant: CGFloat = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed ? -140 : -175
        
        NSLayoutConstraint.activate([
            messageLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor, constant: centerYAnchorConstraintConstant),
            messageLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 40),
            messageLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            logoImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.3),
            logoImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 1.3),
            logoImageView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 170),
            logoImageView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 100)
        ])
    }
}
