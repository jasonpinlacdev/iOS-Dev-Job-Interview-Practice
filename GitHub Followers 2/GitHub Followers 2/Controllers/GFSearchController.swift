//
//  GFSearchController.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/23/20.
//

import UIKit

class GFSearchController: UIViewController {
    
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: GFImage.ghLogo)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    let usernameTextField = GFTextField()
    let searchButton = GFButton(title: "Get Followers", buttonColor: .systemGreen)
    
    var usernameIsValid: Bool {
        get {
            guard let username = usernameTextField.text,
                  !username.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            else { return false }
            return true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        layoutUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @objc func searchButtonTapped() {
        guard usernameIsValid, let username = usernameTextField.text else {
            presentAlert(alertTitle: "Empty Username", alertMessage: "Please enter a valid username. We need to know who to look for.", alertButtonTitle: "Dismiss")
            return
        }
        
        let loadingViewController = GFLoadingViewController()
        present(loadingViewController, animated: true)
        
        GFNetworkManager.shared.getFollowers(for: username, page: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let followers):
                DispatchQueue.main.async {
                    loadingViewController.dismiss(animated: true, completion: {
                        
                        let followersController = GFFollowersController(username: username, followers: followers)
                        self.navigationController?.pushViewController(followersController, animated: true)
                    })
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    loadingViewController.dismiss(animated: true, completion: {
                        self.presentAlert(alertTitle: "Something Went Wrong", alertMessage: error.rawValue, alertButtonTitle: "Dismiss")
                    })
                }
            }
        }
    }
    
    @objc private func dismissKeyboardOnViewTap() {
        view.endEditing(true)
    }
    
    
    // MARK: - Configuration and Layout Logic -
    
    private func configure() {
        title = "Search"
        view.backgroundColor = .systemBackground
        usernameTextField.delegate = self
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnViewTap))
        view.addGestureRecognizer(tapOnView)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
    }
    
    private func layoutUI() {
        self.view.addSubview(logoImageView)
        self.view.addSubview(searchButton)
        self.view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.35),
            logoImageView.widthAnchor.constraint(equalTo: logoImageView.heightAnchor),
            logoImageView.bottomAnchor.constraint(equalTo: usernameTextField.topAnchor, constant: -40),
            
            usernameTextField.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            usernameTextField.heightAnchor.constraint(equalTo: usernameTextField.widthAnchor, multiplier: 0.175),
            usernameTextField.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            usernameTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
            searchButton.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor, multiplier: 0.175),
            searchButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            searchButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
        ])
    }
}

extension GFSearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
