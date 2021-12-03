//
//  GFAlertController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/1/21.
//

import UIKit

class GFAlertController: UIViewController {
  
  let alertContainerView = GFAlertContainerView()
  let alertTitleLabel = GFTitleLabel(alignment: .center)
  let alertBodyLabel = GFBodyLabel(alignment: .center)
  let alertButton = GFButton(title: "Dismiss", color: .systemPink)

  var alertTitle: String
  var alertMessage: String
  var alertButtonText: String
  
  
  init(alertTitle: String, alertMessage: String, alertButtonText: String) {
    self.alertTitle = alertTitle
    self.alertMessage = alertMessage
    self.alertButtonText = alertButtonText
    super.init(nibName: nil, bundle: nil)
    self.modalPresentationStyle = .overFullScreen
    self.modalTransitionStyle = .crossDissolve
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
    alertButton.addTarget(self, action: #selector(dismissAlert), for: .touchUpInside)
  }
  
  
  private func configure() {
    self.view.backgroundColor = UIColor(white: 0.0, alpha: 0.80)
    alertTitleLabel.text = alertTitle
    alertBodyLabel.text = alertMessage
  }
  
  
  private func configureLayout() {
    self.view.addSubview(alertContainerView)
    alertContainerView.addSubview(alertTitleLabel)
    alertContainerView.addSubview(alertBodyLabel)
    alertContainerView.addSubview(alertButton)
    
    NSLayoutConstraint.activate([
      alertContainerView.heightAnchor.constraint(equalTo: alertContainerView.widthAnchor),
      alertContainerView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.80),
      alertContainerView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
      alertContainerView.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
      
      alertTitleLabel.topAnchor.constraint(equalTo: alertContainerView.topAnchor),
      alertTitleLabel.centerXAnchor.constraint(equalTo: alertContainerView.centerXAnchor),
      alertTitleLabel.widthAnchor.constraint(equalTo: alertContainerView.widthAnchor, multiplier: 0.90),
      alertTitleLabel.heightAnchor.constraint(equalTo: alertContainerView.heightAnchor, multiplier: 0.25),
      
      
      alertBodyLabel.topAnchor.constraint(equalTo: alertTitleLabel.bottomAnchor),
      alertBodyLabel.centerXAnchor.constraint(equalTo: alertContainerView.centerXAnchor),
      alertBodyLabel.widthAnchor.constraint(equalTo: alertContainerView.widthAnchor, multiplier: 0.90),
      alertBodyLabel.heightAnchor.constraint(equalTo: alertContainerView.heightAnchor, multiplier: 0.50),


      alertButton.topAnchor.constraint(equalTo: alertBodyLabel.bottomAnchor),
      alertButton.centerXAnchor.constraint(equalTo: alertBodyLabel.centerXAnchor),
      alertButton.widthAnchor.constraint(equalTo: alertContainerView.widthAnchor, multiplier: 0.90),
      alertButton.heightAnchor.constraint(equalTo: alertContainerView.heightAnchor, multiplier: 0.20),
    ])
  }
  
  
  @objc private func dismissAlert() {
    dismiss(animated: true, completion: nil)
  }
  
}
