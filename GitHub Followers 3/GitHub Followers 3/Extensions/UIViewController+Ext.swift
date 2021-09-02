//
//  UIViewController+Ext.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

extension UIViewController {
  
  func presentGFAlertViewController(titleText: String, bodyText: String, buttonText: String) {
    DispatchQueue.main.async {
      let alertViewController = GFAlertViewController(titleText: titleText, bodyText: bodyText, buttonText: buttonText)
      alertViewController.modalPresentationStyle = .overFullScreen
      alertViewController.modalTransitionStyle = .crossDissolve
      self.present(alertViewController, animated: true, completion: nil)
    }
  }
  
}
