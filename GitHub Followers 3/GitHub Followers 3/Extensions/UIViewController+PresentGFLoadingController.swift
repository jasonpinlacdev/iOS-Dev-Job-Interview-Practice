//
//  UIViewController+PresentGFLoadingController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

extension UIViewController {
  
  func presentGFLoadingController() {
    let loadingController = GFLoadingController()
    self.present(loadingController, animated: true, completion: nil)
  }
  
  
}
