//
//  GFItemInfoVIew.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/22/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

enum ItemInfoType {
    case repos
    case gists
    case followers
    case following
}


class GFItemInfoView: UIView {
    
    var symbolImageView = UIImageView()
    var titleLabel = GFTitleLabel(textAlignment: .left, size: 14)
    var countLabel = GFTitleLabel(textAlignment: .center, size: 14)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func set(itemInfoType: ItemInfoType, withCount: Int) {
        switch itemInfoType {
        case .repos:
            symbolImageView.image = SFSymbolsImages.folder
            titleLabel.text = "Public Repos"
            countLabel.text = "\(withCount)"
        case .gists:
            symbolImageView.image = SFSymbolsImages.textAlignLeft
            titleLabel.text = "Public Gists"
            countLabel.text = "\(withCount)"
        case .following:
            symbolImageView.image = SFSymbolsImages.heart
            titleLabel.text = "Following"
            countLabel.text = "\(withCount)"
        case .followers:
            symbolImageView.image = SFSymbolsImages.persons
            titleLabel.text = "Followers"
            countLabel.text = "\(withCount)"
        }
    }
    
    
    // MARK: - Private Section -
    
    
    private func configure() {
        addSubViews(symbolImageView, titleLabel, countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        NSLayoutConstraint.activate([
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20.0),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20.0),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12.0),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18.0),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4.0),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18.0),
        ])
    }
}
