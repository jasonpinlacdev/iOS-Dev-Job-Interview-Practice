//
//  UIViewController+PresentGFAlert.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

extension UIViewController {
  
  func presentGFAlertController(alertTitle: String, alertMessage: String, alertButtonText: String) {
    let alertController = GFAlertController(alertTitle: alertTitle, alertMessage: alertMessage, alertButtonText: alertButtonText)
    self.present(alertController, animated: true, completion: nil)
  }
  
}
