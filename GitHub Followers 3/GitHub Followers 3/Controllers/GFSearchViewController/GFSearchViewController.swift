//
//  GFSearchViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/9/21.
//

import UIKit

class GFSearchViewController: UIViewController {
  
  let logoImageView = GFImageView(image: GFImage.logo.image)
  let searchTextField = GFTextField(placeholderText: "Username")
  let searchButton = GFButton(text: "Search", color: UIColor.systemGreen)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Search"
    view.backgroundColor = .systemBackground
    configureLayout()
    searchTextField.delegate = self
  }
  
  
  private func configureLayout() {

    self.view.addSubview(logoImageView)
    logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
    logoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
    logoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor).isActive = true

    self.view.addSubview(searchTextField)
    self.view.addSubview(searchButton)
    searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    searchTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 15).isActive = true
    searchTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90).isActive = true
    searchTextField.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
    
    self.view.addSubview(searchButton)
    searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20).isActive = true
    searchButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75).isActive = true
    searchButton.heightAnchor.constraint(equalToConstant: 75.0).isActive = true
  }
  
  
  
}

extension GFSearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }
}
