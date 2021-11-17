//
//  GFUserDetailCardElementView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

class GFUserDetailCardElementView: UIView {
  
  let elementSymbolImageView: UIImageView = {
    let elementSymbolImageView = UIImageView()
    elementSymbolImageView.tintColor = .black
    elementSymbolImageView.contentMode = .scaleAspectFit
    elementSymbolImageView.translatesAutoresizingMaskIntoConstraints = false
    elementSymbolImageView.clipsToBounds = true
    return elementSymbolImageView
  }()
  
  let elementNameLabel: UILabel = {
    let elementNameLabel = UILabel()
    elementNameLabel.textAlignment = .left
    elementNameLabel.textColor = .black
    elementNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    elementNameLabel.translatesAutoresizingMaskIntoConstraints = false
    return elementNameLabel
  }()

  let elementValueLabel: UILabel = {
    let elementValueLabel = UILabel()
    elementValueLabel.textAlignment = .center
    elementValueLabel.textColor = .black
    elementValueLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    elementValueLabel.translatesAutoresizingMaskIntoConstraints = false
    return elementValueLabel
  }()
  
  init(elementSymbol: UIImage?, elementName: String, elementValue: Int) {
    super.init(frame: .zero)
    configure()
    configureLayout()
    elementNameLabel.text = elementName
    elementSymbolImageView.image = elementSymbol
    elementValueLabel.text = "\(elementValue)"
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.layer.cornerRadius = 16
  }
  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    
    self.addSubview(elementSymbolImageView)
    self.addSubview(elementNameLabel)
    self.addSubview(elementValueLabel)
    
    NSLayoutConstraint.activate([
      elementSymbolImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.33),
      elementSymbolImageView.widthAnchor.constraint(equalTo: elementSymbolImageView.heightAnchor),
      elementSymbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
      elementSymbolImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      
      elementNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      elementNameLabel.leadingAnchor.constraint(equalTo: elementSymbolImageView.trailingAnchor, constant: padding),
      elementNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
      elementNameLabel.heightAnchor.constraint(equalTo: elementSymbolImageView.heightAnchor),

      elementValueLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
      elementValueLabel.topAnchor.constraint(equalTo: elementSymbolImageView.bottomAnchor, constant: padding),
      elementValueLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

    ])
  }

}
