//
//  GFAlertViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import UIKit

class GFAlertViewController: UIViewController {
  
  let containerView: UIView = {
    let view = UIView()
    view.backgroundColor = .systemBackground
    view.layer.cornerRadius = 16
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.systemGray.cgColor
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let titleLabel = GFTitleLabel(alignment: .center, fontSize: 31.0)
  let bodyLabel = GFBodyLabel(alignment: .center)
  lazy var button = GFButton(buttonTitle: self.buttonText, buttonColor: .systemPink)
  
  let titleText: String
  let bodyText: String
  let buttonText: String
  
  init(titleText: String, bodyText: String, buttonText: String) {
    self.titleText = titleText
    self.bodyText = bodyText
    self.buttonText = buttonText
    super.init(nibName: nil, bundle: nil)
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
    view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    titleLabel.text = self.titleText
    bodyLabel.text = self.bodyText
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
  }
  
  private func configureLayout() {
    let padding: CGFloat = 20.0
    
    view.addSubview(containerView)
    containerView.addSubview(titleLabel)
    containerView.addSubview(bodyLabel)
    containerView.addSubview(button)
    
    NSLayoutConstraint.activate([
      containerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: padding * -2),
      containerView.heightAnchor.constraint(equalTo: containerView.widthAnchor),
      containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
      titleLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      titleLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: padding * -2),
      titleLabel.heightAnchor.constraint(equalToConstant: 75),
      
      bodyLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
      bodyLabel.bottomAnchor.constraint(equalTo: button.topAnchor),
      bodyLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: padding * -2),
      
      button.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
      button.widthAnchor.constraint(equalTo: containerView.widthAnchor, constant: padding * -2),
      button.heightAnchor.constraint(equalToConstant: 50),
      button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
      
    ])
  }
  
  @objc private func buttonTapped() {
    self.dismiss(animated: true, completion: nil)
  }
  
  
}
