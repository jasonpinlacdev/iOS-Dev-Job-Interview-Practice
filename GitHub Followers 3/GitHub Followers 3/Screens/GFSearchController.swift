//
//  GFSearchController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/30/21.
//

import UIKit

class GFSearchController: UIViewController {
  
  let mainLogoImageView: UIImageView = {
    let imageView = UIImageView(image: GFImage.mainLogo.image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  let searchTextField = GFSearchTextField()
  let searchButton = GFButton(title: "Search", color: .systemGreen)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
    configureSearchTextFieldForKeyboardDismissal()
    searchButton.addTarget(self, action: #selector(searchFollowers), for: .touchUpInside)
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  
  private func configure() {
    self.title = "GFSearchController"
    self.navigationItem.largeTitleDisplayMode = .never
    self.view.backgroundColor = .systemBackground
  }
  
  
  private func configureLayout() {
    view.addSubview(mainLogoImageView)
    view.addSubview(searchTextField)
    view.addSubview(searchButton)
    
    NSLayoutConstraint.activate([
      mainLogoImageView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      mainLogoImageView.heightAnchor.constraint(equalTo: mainLogoImageView.widthAnchor),
      mainLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      mainLogoImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
      mainLogoImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
      
      searchTextField.topAnchor.constraint(equalTo: mainLogoImageView.bottomAnchor, constant: 15.0),
      searchTextField.heightAnchor.constraint(equalToConstant: 75.0),
      searchTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
      searchTextField.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      
      searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 15),
      searchButton.heightAnchor.constraint(equalToConstant: 75.0),
      searchButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.90),
      searchButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
    ])
  }
  
  
  @objc private func searchFollowers() {
    searchTextField.resignFirstResponder()
    
    guard let username = searchTextField.text else { return }
    if username.isEmpty { self.presentGFAlertController(alertTitle: GFError.emptyUsername.errorTitle, alertMessage: GFError.emptyUsername.errorMessageDescription, alertButtonText: "Dismiss"); return }
    
    self.showLoadingView()
    GFNetworkManager.shared.getFollowers(for: username) { [weak self] result in
      DispatchQueue.main.async {
        self?.removeLoadingView()
        switch result {
        case .success(let followers):
          let followersController = GFFollowersController(username: username, followers: followers)
          self?.navigationController?.pushViewController(followersController, animated: true)
        case .failure(let error):
          self?.presentGFAlertController(alertTitle: error.errorTitle, alertMessage: error.errorMessageDescription, alertButtonText: "Dismiss")
        }
      }
    }
  }
  
}


// This extension is for the different implementations that are used to dismiss the searchTextField's keyboard
// 1) UITextFieldDelegate protocol method - textFieldShouldReturn to resign firstResponder keyboard
// 2) UITextField extension method to addDoneButton to invoke the searchController's view.endEditing method
// 3) UIGestureRecognizer for a tap on the searchControllers view to invoke the searchController's view.endEditing method
// Also we use the global NotificationCenter.default to subscribe to the keyboardShowing and keyboardHiding events to adjust our view as keyboard propagates
extension GFSearchController: UITextFieldDelegate {
  
  private func configureSearchTextFieldForKeyboardDismissal() {
    searchTextField.delegate = self
    searchTextField.addDoneButton(target: self, selector: #selector(keyboardToolbarDoneButtonTapped))
    let dismissKeyboardOnTapGestureRecognizer = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
    self.view.addGestureRecognizer(dismissKeyboardOnTapGestureRecognizer)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // when the textField returns you dismiss/resign the firstResponder which in this case is the Keyboard.
    return textField.resignFirstResponder()
  }
  
  
  @objc private func keyboardToolbarDoneButtonTapped() {
    self.view.endEditing(true)
  }
  
  
  @objc private func keyboardWillShow(notification: NSNotification) {
    guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
    let bottomOfSearchButton = searchButton.frame.maxY
    let topOfKeyboard = keyboardFrame.minY
    if bottomOfSearchButton > topOfKeyboard { // this means keyboard overlaps button
      let overlap = bottomOfSearchButton - topOfKeyboard
      self.view.frame.origin.y = 0 - overlap - 15
    }
  }
  
  
  @objc private func keyboardWillHide(notification: NSNotification) {
    self.view.frame.origin.y = 0
  }
  
}
