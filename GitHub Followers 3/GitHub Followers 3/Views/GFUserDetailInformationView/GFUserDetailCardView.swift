//
//  GFUserDetailCardView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/14/21.
//

import UIKit

protocol GFUserDetailCardViewDelegate {
  func didTapActionButton()
}


class GFUserDetailCardView: UIView {
  
  let user: GFUser
  
  var delegate: GFUserDetailCardViewDelegate?
  
  let leftDetailCardElementView: GFUserDetailCardElementView
  let rightDetailCardElementView: GFUserDetailCardElementView
  let actionButton: GFButton
  
  init(user: GFUser, actionButtonTitle: String, actionButtonColor: UIColor) {
    self.user = user
    
    leftDetailCardElementView = GFUserDetailCardElementView(user: user)
    rightDetailCardElementView = GFUserDetailCardElementView(user: user)
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
    
    actionButton.addTarget(self, action: #selector(didTapActionButton), for: .touchUpInside)
  }
  
  private func configureLayout() {
    
    leftDetailCardElementView.translatesAutoresizingMaskIntoConstraints = false
    rightDetailCardElementView.translatesAutoresizingMaskIntoConstraints = false
    actionButton.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(leftDetailCardElementView)
    self.addSubview(rightDetailCardElementView)
    self.addSubview(actionButton)
    
    NSLayoutConstraint.activate([
      actionButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.75),
      actionButton.heightAnchor.constraint(equalToConstant: 75.0),
      actionButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      actionButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
    ])
    
  }
  
  @objc private func didTapActionButton() {
    self.delegate?.didTapActionButton()
  }
  
  
  
}
