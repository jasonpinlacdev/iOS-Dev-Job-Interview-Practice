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
        configure()
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
    }
    
    private func layoutUI() {
        
    }
    
}
