//
//  UIView + EXT.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

extension UIView {
    
    func turnOnRedBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemRed.cgColor
    }
    
    func turnOnBlueBorder() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemBlue.cgColor
    }
}
