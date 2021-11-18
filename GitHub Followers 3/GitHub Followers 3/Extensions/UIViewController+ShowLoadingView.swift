//
//  UIViewController+ShowLoadingView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/17/21.
//

import Foundation
import UIKit


var globalLoadingView: UIView?


extension UIViewController {
  
  func showLoadingView(on view: UIView, completionHandler: (() -> Void)? = nil) {
    let loadingView = UIView(frame: view.bounds)
    loadingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    globalLoadingView = loadingView
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    activityIndicatorView.startAnimating()
    activityIndicatorView.center = loadingView.center

    loadingView.addSubview(activityIndicatorView)
    view.addSubview(loadingView)
    completionHandler?()
  }
  
  
  func removeLoadingView(completionHandler: (() -> Void)? = nil) {
    globalLoadingView?.removeFromSuperview()
    globalLoadingView = nil
    completionHandler?()
  }
  
}
