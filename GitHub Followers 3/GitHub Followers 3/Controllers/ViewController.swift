//
//  ViewController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 8/30/21.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    getUserJSON(for: "jasonpinlacdev")
  }
  
  func getUserJSON(for username: String) {
    let token = "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"
    let url = URL(string: "https://api.github.com/rate_limit")!
    var request = URLRequest(url: url)
    request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

    let urlSessionConfiguration = URLSessionConfiguration.default
    urlSessionConfiguration.waitsForConnectivity = true
    
    let urlSession = URLSession(configuration: urlSessionConfiguration)
    
    let urlSessionDataTask = urlSession.dataTask(with: request) { data, urlResponse, error in
      guard error == nil else { return }
      guard let urlResponse = urlResponse as? HTTPURLResponse, (0...200).contains(urlResponse.statusCode) else { return }
      
      guard let data = data,
            
            let dataAsString = String(data: data, encoding: .utf8) else { return }
      print(dataAsString)
    }
    
    urlSessionDataTask.resume()
  }
  
}

