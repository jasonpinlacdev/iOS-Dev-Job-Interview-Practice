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
    configureLayout()
    searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(true, animated: false)
  }
  
  private func configureLayout() {
    view.backgroundColor = .systemBackground
    
    view.addSubview(GFLogoImageView)
    view.addSubview(searchTextField)
    view.addSubview(searchButton)
    
    NSLayoutConstraint.activate([
      GFLogoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      GFLogoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      GFLogoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
      GFLogoImageView.heightAnchor.constraint(equalTo: GFLogoImageView.widthAnchor),

      searchTextField.topAnchor.constraint(equalTo: GFLogoImageView.bottomAnchor, constant: 20),
      searchTextField.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -40),
      searchTextField.heightAnchor.constraint(equalToConstant: 75),
      searchTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
      
      searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
      searchButton.widthAnchor.constraint(equalTo: searchTextField.widthAnchor, multiplier: 0.5),
      searchButton.heightAnchor.constraint(equalTo: searchTextField.heightAnchor, multiplier: 0.75),
      searchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  @objc private func searchButtonTapped() {
    print("Search button tapped!")
  }
  
  
  
  
  
  
  
  
  //  func getUserJSON(for username: String) {
  //    //    let token = "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"
  //    let url = URL(string: "https://api.github.com/rate_limit")!
  //    //    let url = URL(string: "https://api.github.com/users/\(username)")!
  //    var request = URLRequest(url: url)
  //    //    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
  //
  //    let urlSessionConfiguration = URLSessionConfiguration.default
  //    urlSessionConfiguration.waitsForConnectivity = true
  //
  //    let urlSession = URLSession(configuration: urlSessionConfiguration)
  //
  //    let urlSessionDataTask = urlSession.dataTask(with: request) { data, urlResponse, error in
  //      guard error == nil else { return }
  //      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { return }
  //
  //      guard let data = data,
  //
  //            let dataAsString = String(data: data, encoding: .utf8) else { return }
  //      print(dataAsString)
  //    }
  //
  //    urlSessionDataTask.resume()
  //  }
  
  
}
