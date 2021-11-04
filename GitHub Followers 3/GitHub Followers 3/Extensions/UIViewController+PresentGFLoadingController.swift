//
//  UIViewController+PresentGFLoadingController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

extension UIViewController {
  
  func presentGFLoadingController(animated: Bool, completion: (()->Void)?) {
    let loadingController = GFLoadingController()
    self.present(loadingController, animated: true, completion: completion)
  }
  
  func dismissGFLoadingController(animated: Bool, completion: (()->Void)?) {
    self.dismiss(animated: animated, completion: completion)
  }
  
  
}
