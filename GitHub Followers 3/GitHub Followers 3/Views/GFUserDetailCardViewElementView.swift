//
//  GFUserDetailCardElementView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/11/21.
//

import UIKit

class GFUserDetailCardViewElementView: UIView {

  private let elementImageView = UIImageView()
  private let elementTitleLabel = UILabel()
  private let elementValueLabel = UILabel()
  
  private let horizontalStackView: UIStackView = {
    let horizontalStackView = UIStackView(frame: .zero)
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    horizontalStackView.axis = .horizontal
    return horizontalStackView
  }()
  
  private let verticalStackView: UIStackView = {
    let verticalStackView = UIStackView()
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.axis = .vertical
    return verticalStackView
  }()

  
  init(symbol: UIImage, title: String, value: Int) {
    super.init(frame: .zero)
    configure(symbol: symbol, title: title, value: value)
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure(symbol: UIImage, title: String, value: Int) {
    elementImageView.image = symbol
    elementTitleLabel.text = title
    elementValueLabel.text = "\(value)"
    self.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func configureLayout() {
    elementImageView.translatesAutoresizingMaskIntoConstraints = false
    elementTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    elementValueLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(verticalStackView)

    verticalStackView.addSubview(horizontalStackView)
    verticalStackView.addSubview(elementValueLabel)
    
    horizontalStackView.addSubview(elementImageView)
    horizontalStackView.addSubview(elementTitleLabel)
    
    NSLayoutConstraint.activate([
      verticalStackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      verticalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      verticalStackView.widthAnchor.constraint(equalTo: self.widthAnchor),
      verticalStackView.heightAnchor.constraint(equalTo: self.heightAnchor),
    ])
  }
  
  
}
