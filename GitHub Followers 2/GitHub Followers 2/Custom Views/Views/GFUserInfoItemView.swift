//
//  GFUserInfoItemView.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/18/20.
//

import UIKit

class GFUserInfoItemView: UIView {
    
    let iconName: String
    let title: String
    let count: Int
    
    lazy var iconImageView = UIImageView(image: UIImage(systemName: iconName))
    let titleLabel = UILabel()
    let countLabel = UILabel()
    
    let horizontalStackView: UIStackView = {
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .fill
        horizontalStack.alignment = .fill
        return horizontalStack
    }()
    
    init(iconName: String, title: String, count: Int) {
        self.iconName = iconName
        self.title = title
        self.count = count
        super.init(frame: .zero)
        configure()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        iconImageView.contentMode = .scaleAspectFill
        iconImageView.tintColor = .label
        iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = .label
        
        countLabel.text = "\(count)"
        countLabel.textAlignment = .center
        countLabel.font = UIFont.systemFont(ofSize: 14)
        countLabel.textColor = .label
    }
    
    private func layoutUI() {
        let arrayOfViews = [horizontalStackView, iconImageView, titleLabel, countLabel]
        arrayOfViews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        horizontalStackView.addArrangedSubview(iconImageView)
        horizontalStackView.addArrangedSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            iconImageView.heightAnchor.constraint(equalTo: iconImageView.widthAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 20),
        
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalStackView.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
        
        
    }
    
}
