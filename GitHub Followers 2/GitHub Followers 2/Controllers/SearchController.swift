import UIKit

class SearchController: UIViewController {
    
    let logoImageView: UIImageView = {
        let logoImageView = UIImageView(image: UIImage(named: "gh-logo"))
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        return logoImageView
    }()
    let usernameTextField = GFTextField()
    let searchButton = GFButton(title: "Get Followers", buttonColor: .systemGreen)


    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        configure()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func configure() {
        usernameTextField.delegate = self
        let tapOnView = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboardOnViewTap))
        view.addGestureRecognizer(tapOnView)
    }
    
    @objc private func dismissKeyboardOnViewTap() {
        view.endEditing(true)
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

extension SearchController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
