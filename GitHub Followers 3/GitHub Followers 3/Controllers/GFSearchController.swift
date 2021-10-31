//
//  GFSearchController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 10/30/21.
//

import UIKit

class GFSearchController: UIViewController {
  
  
  // NEXT THING TO DO IS DISMISS KEYBOARD
  
  
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
  }
  
  override func viewDidAppear(_ animated: Bool) {
    navigationController?.setNavigationBarHidden(true, animated: false)
  }

  private func configure() {
    self.title = "GFSearchController"
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
  
  
}
