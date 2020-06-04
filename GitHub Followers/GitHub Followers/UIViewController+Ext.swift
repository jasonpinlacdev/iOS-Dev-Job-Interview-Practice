//
//  UIViewController+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 6/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let gfAlertController = GFAlertViewController(alertTitle: title, alertMessage: message, buttonTitle: buttonTitle)
            gfAlertController.modalPresentationStyle = .overFullScreen
            gfAlertController.modalTransitionStyle = .crossDissolve
            self.present(gfAlertController, animated: true)
        }
    }
    
    
    func presentSafariViewController(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemGreen
        present(safariViewController, animated: true)
    }
}

