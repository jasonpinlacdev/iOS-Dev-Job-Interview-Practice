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
    
    init(iconName: String, title: String, count: Int) {
        self.iconName = iconName
        self.title = title
        self.count = count
        super.init(frame: .zero)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconImageView: UIImageView = {
        let iconImageView = UIImageView(image: UIImage(systemName: iconName))
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        return iconImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.textAlignment = .left
        titleLabel.textColor = .label
        titleLabel.text = title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        return titleLabel
    }()
    
    lazy var countLabel: UILabel = {
        let countLabel = UILabel(frame: .zero)
        countLabel.textAlignment = .center
        countLabel.textColor = .label
        countLabel.text = "\(count)"
        countLabel.font = UIFont.preferredFont(forTextStyle: .body)
        return countLabel
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .fill
        horizontalStackView.spacing = 10.0
        horizontalStackView.addArrangedSubview(iconImageView)
        horizontalStackView.addArrangedSubview(titleLabel)
        return horizontalStackView
    }()
    
    lazy var verticalStackView: UIStackView = {
        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fillEqually
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(countLabel)
        return verticalStackView
    }()

    private func layoutUI() {
        self.addSubview(verticalStackView)
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: self.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            iconImageView.widthAnchor.constraint(equalTo: horizontalStackView.widthAnchor, multiplier: 0.20),
        ])
    }
    
}
