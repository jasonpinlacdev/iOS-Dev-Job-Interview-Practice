//
//  UIViewController+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/1/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//


import UIKit

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let gfAlertController = GFAlertViewController(alertTitle: title, alertMessage: message, buttonTitle: buttonTitle)
            gfAlertController.modalPresentationStyle = .overFullScreen
            gfAlertController.modalTransitionStyle = .crossDissolve
            self.present(gfAlertController, animated: true)
        }
    }
    
}


