//
//  GFLoadingViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFLoadingViewController: UIViewController {
  
  let spinner = UIActivityIndicatorView(style: .large)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
  }
  
  private func configure() {
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    spinner.startAnimating()
  }
  
  private func configureLayout() {
    spinner.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(spinner)
    
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      spinner.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
      spinner.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
    ])
  }
  

}
