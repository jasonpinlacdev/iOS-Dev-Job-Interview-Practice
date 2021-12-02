//
//  GFFavoritesEmptyStateView.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/30/21.
//

import UIKit

class GFFavoritesEmptyStateView: UIView {

  let emptyStateImageView: UIImageView = {
    let emptyStateImageView = UIImageView()
    emptyStateImageView.image = GFImage.emptyStateLogo.image
    emptyStateImageView.contentMode = .scaleAspectFill
    return emptyStateImageView
  }()
  
  let emptyStateMessageLabel: UILabel = {
    let emptyStateMessageLabel = UILabel()
    emptyStateMessageLabel.textAlignment = .center
    emptyStateMessageLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
    emptyStateMessageLabel.numberOfLines = 0
    emptyStateMessageLabel.text = "You don't have any users favorited."
    return emptyStateMessageLabel
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
    configureLayout()
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  private func configure() {
    self.backgroundColor = .systemBackground
  }
  
  
  private func configureLayout() {
    emptyStateImageView.translatesAutoresizingMaskIntoConstraints = false
    emptyStateMessageLabel.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(emptyStateImageView)
    self.addSubview(emptyStateMessageLabel)
    
    NSLayoutConstraint.activate([
      emptyStateMessageLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
      emptyStateMessageLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
      emptyStateMessageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      emptyStateMessageLabel.topAnchor.constraint(equalTo: self.topAnchor),
    
      emptyStateImageView.heightAnchor.constraint(equalTo: self.heightAnchor),
      emptyStateImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
      emptyStateImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: UIScreen.main.bounds.width/3.0),
      emptyStateImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: UIScreen.main.bounds.height/5.0),
    ])
  }
  
}
