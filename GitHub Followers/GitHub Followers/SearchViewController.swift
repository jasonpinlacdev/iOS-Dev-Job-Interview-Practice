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
//        configureObserverForKeyboardNotifications()
    }
    
    
    // viewWillAppear is where you want to show/hide elements
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        userNameTextField.text = ""
    }
    
    
    @objc func pushFollowersViewController() {
        guard isUserNameEntered else {
            presentGFAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😅.", buttonTitle: "Ok")
            return
        }
        
        userNameTextField.resignFirstResponder()
        
        let followersViewController = FollowersViewController(username: userNameTextField.text!)
        navigationController?.pushViewController(followersViewController, animated: true)
    }
    
    
    // MARK: - Private Section -
    
    
    private func configureLogoImageView() {
        logoImageView.image = Images.ghLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        let topAnchorConstraintConstant: CGFloat = DeviceType.isiPhoneSE || DeviceType.isiPhone8Zoomed ? 20 : 80
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topAnchorConstraintConstant),
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
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
//    private func configureObserverForKeyboardNotifications() {
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }
//
//
//    @objc func keyboardWillShow(notification: NSNotification) {
//        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
//        let keyboardFrame = keyboardValue.cgRectValue
//
//        let keybordHeight = keyboardFrame.size.height
//        let viewHeight = UIScreen.main.bounds.size.height
//
//        let topOfKeyboardHeight = viewHeight - keybordHeight
//        let bottomOfUsernameTextField = userNameTextField.convert(userNameTextField.bounds, to: view).maxY
//
//        if bottomOfUsernameTextField > topOfKeyboardHeight {
//            view.frame.origin.y = 0 - userNameTextField.frame.size.height
//        }
//    }
//
//
//    @objc func keyboardWillHide(notification: NSNotification) {
//        view.frame.origin.y = 0
//    }
//
//

}

// MARK: - Extensions -

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowersViewController()
        return true
    }
}
