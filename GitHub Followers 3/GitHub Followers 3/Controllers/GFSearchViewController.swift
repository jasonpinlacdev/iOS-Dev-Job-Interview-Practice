//
//  GFSearchViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 8/31/21.
//

import UIKit

class GFSearchViewController: UIViewController {
  
  let GFLogoImageView: UIImageView = {
    let imageView = UIImageView(image: UIImage(named: GFImage.mainLogo))
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let searchTextField = GFSearchTextField()
  let searchButton: GFButton = GFButton(buttonTitle: "Search", buttonColor: .systemGreen)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: true)
  }
  
  private func configure() {
    searchTextField.delegate = self
    searchTextField.addDoneButton(target: self, selector: #selector(textFieldDoneButtonTapped))
    let tapToEndEditing = UITapGestureRecognizer(target: self, action: #selector(textFieldDoneButtonTapped))
    self.view.addGestureRecognizer(tapToEndEditing)
    searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
  }
  
  private func configureLayout() {
    let padding: CGFloat = 20.0
    
    view.backgroundColor = .systemBackground
    view.addSubview(GFLogoImageView)
    view.addSubview(searchTextField)
    view.addSubview(searchButton)
    NSLayoutConstraint.activate([
      GFLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
      GFLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      GFLogoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: padding * -4),
      GFLogoImageView.heightAnchor.constraint(equalTo: GFLogoImageView.widthAnchor),
      searchTextField.topAnchor.constraint(equalTo: GFLogoImageView.bottomAnchor, constant: padding * 2),
      searchTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: padding * -2),
      searchTextField.heightAnchor.constraint(equalToConstant: 50),
      searchTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      searchButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: padding * -2),
      searchButton.widthAnchor.constraint(equalTo: searchTextField.widthAnchor),
      searchButton.heightAnchor.constraint(equalToConstant: 50),
      searchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc func textFieldDoneButtonTapped() {
    self.view.endEditing(true)
  }
  
  @objc private func searchButtonTapped() {
    guard let username = searchTextField.text else { return }
    guard !username.isEmpty else { presentGFAlertViewController(titleText: "Username Empty", bodyText: "The username field is empty.\n Type in a username to search for its followers.", buttonText: "Dismiss"); return }
    
    presentGFLoadingViewController()

    NetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
      self?.dismissGFLoadingViewController {
        switch result {
        case .failure(let error):
          self?.presentGFAlertViewController(titleText: "Something went wrong", bodyText: error.rawValue, buttonText: "Dismiss")
        case .success(let followers):
          DispatchQueue.main.async {
            let followersViewController = GFFollowersViewController(username: username, followers: followers)
            self?.navigationController?.pushViewController(followersViewController, animated: true)
          }
        }
      }
    }
    
  }
  
  
  

  
  
}


extension GFSearchViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return textField.resignFirstResponder()
  }
}
