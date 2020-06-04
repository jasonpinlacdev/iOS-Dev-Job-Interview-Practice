//
//  DataLoadingViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 6/3/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class GFDataLoadingViewController: UIViewController {
    
    var loadingView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        UIView.animate(withDuration: 0.25, animations: { self.loadingView.alpha = 0.8 } )
    }
    
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25, animations: { self.loadingView.alpha = 0.0 }) { finished in
                self.loadingView.removeFromSuperview()
                self.loadingView = nil
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
