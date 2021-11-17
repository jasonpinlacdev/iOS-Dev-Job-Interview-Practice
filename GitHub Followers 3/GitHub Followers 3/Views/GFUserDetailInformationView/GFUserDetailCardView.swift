//
//  GFUserDetailCardView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

class GFUserDetailCardView: UIView {
  
  let leftDetailCardElementView: GFUserDetailCardElementView
  let rightDetailCardElementView: GFUserDetailCardElementView
  let actionButton: GFButton
  
  var onActionButtonTap: ((GFButton)-> Void)?
  
  let horizontalStackView: UIStackView = {
    let horizontalStackView = UIStackView()
    horizontalStackView.axis = .horizontal
    horizontalStackView.alignment = .fill
    horizontalStackView.distribution = .fillEqually
    horizontalStackView.spacing = 10.0
    horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
    return horizontalStackView
  }()
  
  init(leftElementSymbol: UIImage?, leftElementName: String, leftElementValue: Int, rightElementSymbol: UIImage?, rightElementName: String, rightElementValue: Int, actionButtonTitle: String, actionButtonColor: UIColor) {
    leftDetailCardElementView = GFUserDetailCardElementView(elementSymbol: leftElementSymbol, elementName: leftElementName, elementValue: leftElementValue)
    rightDetailCardElementView = GFUserDetailCardElementView(elementSymbol: rightElementSymbol, elementName: rightElementName, elementValue: rightElementValue)
    actionButton = GFButton(title: actionButtonTitle, color: actionButtonColor)
    super.init(frame: .zero)
    configure()
    configureLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.backgroundColor = .systemGray3
    self.layer.cornerRadius = 16
    actionButton.addTarget(self, action: #selector(actionButtonTapped) , for: .touchUpInside)
  }

  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    
    self.addSubview(actionButton)
    self.addSubview(horizontalStackView)
    self.horizontalStackView.addArrangedSubview(leftDetailCardElementView)
    self.horizontalStackView.addArrangedSubview(rightDetailCardElementView)
    
    NSLayoutConstraint.activate([
      horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: padding),
      horizontalStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
      horizontalStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
      horizontalStackView.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: -padding),
      
      actionButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
      actionButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
      actionButton.heightAnchor.constraint(equalToConstant: 75.0),
      actionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding),
    ])
  }
  
  @objc private func actionButtonTapped() {
    self.onActionButtonTap?(actionButton)
  }
  
  
}

