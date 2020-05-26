//
//  SearchViewController.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 4/28/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var logoImageView = UIImageView()
    let userNameTextField = GFTextField()
    let callToActionButton = GFButton(backgroundColor: UIColor.systemGreen, title: "Get Followers")
    
    var isUserNameEntered: Bool {
        get {
            return !(userNameTextField.text!.isEmpty)
        }
    }
    
    
    // viewDidLoad is called when the view is loaded. This only happens once not matter how many times the view appears or dissapears
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLogoImageView()
        configureUserNameTextField()
        configureCallToActionButton()
        createDismissKeyboardTapGesture()
    }
    
    
    // viewWillAppear is where you want to show/hide elements
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
    @objc func pushFollowersViewController() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😅.", buttonTitle: "Ok")
            return
        }
        let followersViewController = FollowersViewController()
        followersViewController.username = userNameTextField.text
        followersViewController.title = userNameTextField.text
        navigationController?.pushViewController(followersViewController, animated: true)
    }
    
    // MARK: - Private Section -
    
    private func configureLogoImageView() {
        logoImageView = UIImageView(image: UIImage(named: "gh-logo")!)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 200),
            logoImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    private func configureUserNameTextField() {
        view.addSubview(userNameTextField)
        userNameTextField.delegate = self
        
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
            userNameTextField.heightAnchor.constraint(equalToConstant: 50),
            userNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            userNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    
    private func configureCallToActionButton() {
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowersViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            callToActionButton.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 48),
            callToActionButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            callToActionButton.widthAnchor.constraint(equalToConstant: 200),
            callToActionButton.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    
    private func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
    }
    
}


extension SearchViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersViewController()
        return true
    }
}
