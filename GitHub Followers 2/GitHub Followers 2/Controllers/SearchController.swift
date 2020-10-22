import UIKit

class SearchController: UIViewController {
    
    let searchButton = GFButton(title: "Get Followers", buttonColor: .systemGreen)
    let searchTextField = GFTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    func layoutUI() {
        self.view.addSubview(searchButton)
        self.view.addSubview(searchTextField)
        
        NSLayoutConstraint.activate([
            searchButton.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.50),
            searchButton.heightAnchor.constraint(equalTo: searchButton.widthAnchor, multiplier: 0.25),
            searchButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            searchButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor),
            
            searchTextField.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.75),
            searchTextField.heightAnchor.constraint(equalTo: searchButton.widthAnchor, multiplier: 0.25),
            searchTextField.bottomAnchor.constraint(equalTo: searchButton.topAnchor, constant: -20),
            searchTextField.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
            
        ])
    }

}
