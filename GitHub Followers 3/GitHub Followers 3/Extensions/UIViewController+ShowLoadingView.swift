//
//  UIViewController+ShowLoadingView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/17/21.
//

import Foundation
import UIKit

private var globalLoadingView: UIView?

extension UIViewController {
  
  func showLoadingView(completionHandler: (() -> Void)? = nil) {
    let loadingView = UIView(frame: self.view.bounds)
    loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    globalLoadingView = loadingView

    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    activityIndicatorView.startAnimating()
    activityIndicatorView.center = loadingView.center
    
    loadingView.addSubview(activityIndicatorView)
    self.view.addSubview(loadingView)
    completionHandler?()
  }
  
  
  func removeLoadingView(completionHandler: (() -> Void)? = nil) {
    globalLoadingView?.removeFromSuperview()
    globalLoadingView = nil
    completionHandler?()
  }
  
}
