//
//  UIViewController+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/1/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//


import UIKit
import SafariServices


fileprivate var loadingView: UIView!

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
    
    
    func showLoadingView() {
        loadingView = UIView(frame: view.bounds)
        loadingView.backgroundColor = .systemBackground
        loadingView.alpha = 0.0
        view.addSubview(loadingView)
        
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        loadingView.addSubview(spinner)
        
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 200),
            spinner.heightAnchor.constraint(equalToConstant: 200),
            spinner.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
        ])
        spinner.startAnimating()
        
        UIView.animate(withDuration: 0.25, animations: { loadingView.alpha = 0.8 } )
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25, animations: { loadingView.alpha = 0.0 }) { finished in
                loadingView.removeFromSuperview()
                loadingView = nil
            }
        }
    }
    
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = GFEmptyStateView(message: message)
        emptyStateView.backgroundColor = .systemBackground
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
}



