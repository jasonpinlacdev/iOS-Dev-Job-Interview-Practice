//
//  UIView+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 6/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

extension UIView {
    
    
    func addSubViews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    

    func pinToEdges(of superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor),
        ])
    }
}
