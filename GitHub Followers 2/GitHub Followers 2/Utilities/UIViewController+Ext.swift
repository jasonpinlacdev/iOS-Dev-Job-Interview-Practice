//
//  UIViewController+Ext.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

fileprivate var loadingView: UIView!


extension UIViewController {
    
    func presentAlert(alertTitle: String, alertMessage: String, alertButtonTitle: String) {
        DispatchQueue.main.async {
            let alertController = GFAlertController(alertTitle: alertTitle, alertMessage: alertMessage, alertButtonTitle: alertButtonTitle)
            alertController.modalPresentationStyle = .overFullScreen
            alertController.modalTransitionStyle = .crossDissolve
            self.present(alertController, animated: true)
        }
    }
    
//    func showLoadingView() {
//        DispatchQueue.main.async {
//            loadingView = UIView(frame: self.view.bounds)
//            self.view.addSubview(loadingView)
//            loadingView.backgroundColor = .systemBackground
//            loadingView.alpha = 0.0
//
//            UIView.animate(withDuration: 0.25) {
//                loadingView.alpha = 0.75
//            }
//
//            let activityIndicator = UIActivityIndicatorView(style: .large)
//            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//            loadingView.addSubview(activityIndicator)
//
//            NSLayoutConstraint.activate([
//                activityIndicator.centerXAnchor.constraint(equalTo: loadingView.centerXAnchor),
//                activityIndicator.centerYAnchor.constraint(equalTo: loadingView.centerYAnchor),
//            ])
//
//            activityIndicator.startAnimating()
//        }
//    }
//
//    func dismissLoadingView() {
//        DispatchQueue.main.async {
//            loadingView.removeFromSuperview()
//        }
//    }
    
}
