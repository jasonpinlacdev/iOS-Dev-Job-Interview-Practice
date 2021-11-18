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
  
  func showLoadingView(onView: UIView, completionHandler: (() -> Void)? = nil) {
    let loadingView = UIView(frame: onView.bounds)
    globalLoadingView = loadingView
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    activityIndicatorView.startAnimating()
    loadingView.backgroundColor = UIColor(white: 0.0, alpha: 0.5)
    
    activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    loadingView.addSubview(activityIndicatorView)
    NSLayoutConstraint.activate([
      activityIndicatorView.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
      activityIndicatorView.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
      activityIndicatorView.heightAnchor.constraint(equalTo: loadingView.heightAnchor),
      activityIndicatorView.widthAnchor.constraint(equalTo: loadingView.widthAnchor),
    ])
  
    onView.addSubview(loadingView)
    completionHandler?()
  }
  
  
  func removeLoadingView(completionHandler: (() -> Void)? = nil) {
    globalLoadingView?.removeFromSuperview()
    globalLoadingView = nil
    completionHandler?()
  }
  
}
