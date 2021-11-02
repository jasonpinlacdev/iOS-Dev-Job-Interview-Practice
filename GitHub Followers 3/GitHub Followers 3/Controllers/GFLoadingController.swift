//
//  GFLoadingController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/2/21.
//

import UIKit

class GFLoadingController: UIViewController {
  
  let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    modalPresentationStyle = .overFullScreen
    modalTransitionStyle = .crossDissolve
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
  }

  private func configure() {
    self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.50)
    spinner.startAnimating()
  }
  
  
  private func configureLayout() {
    self.view.addSubview(spinner)
    spinner.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      spinner.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
      spinner.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
    ])

  }

}
