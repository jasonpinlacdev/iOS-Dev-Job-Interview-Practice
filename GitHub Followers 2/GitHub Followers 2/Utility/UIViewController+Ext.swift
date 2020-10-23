//
//  UIViewController+Ext.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

extension UIViewController {
    
    func presentAlert(alertTitle: String, alertMessage: String, alertButtonTitle: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alertController = GFAlertController(alertTitle: alertTitle, alertMessage: alertMessage, alertButtonTitle: alertButtonTitle)
            alertController.modalPresentationStyle = .overFullScreen
            alertController.modalTransitionStyle = .crossDissolve
            self.present(alertController, animated: true)
        }
    }
    
}
