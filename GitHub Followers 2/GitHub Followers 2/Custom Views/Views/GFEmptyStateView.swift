//
//  GFEmptyStateView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/12/20.
//

import UIKit

class GFEmptyStateView: UIView {
    
    let messageLabel: GFTitleLabel

    init(frame: CGRect, message: String) {
        
        messageLabel = {
            let messageLabel = GFTitleLabel(text: message)
            messageLabel.numberOfLines = 3
            messageLabel.textColor = .secondaryLabel
            return messageLabel
        }()
        
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .systemBackground
        
        let emptyStateLogo = UIImageView(image: GFImage.emptyStateLogo)
        emptyStateLogo.translatesAutoresizingMaskIntoConstraints = false
        emptyStateLogo.contentMode = .scaleAspectFill
  
        addSubview(messageLabel)
        addSubview(emptyStateLogo)
        
        NSLayoutConstraint.activate([
            messageLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            messageLabel.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -(self.frame.height * 0.20)),
            messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            emptyStateLogo.widthAnchor.constraint(equalTo: self.widthAnchor),
            emptyStateLogo.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            emptyStateLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: (self.frame.height * 0.20)),
            emptyStateLogo.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
}
