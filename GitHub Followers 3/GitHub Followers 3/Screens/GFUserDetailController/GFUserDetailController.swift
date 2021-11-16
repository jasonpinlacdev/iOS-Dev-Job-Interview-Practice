//
//  GFUserDetailController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/11/21.
//

import UIKit

class GFUserDetailController: UIViewController {
  
  private let user: GFUser
  
  private let topUserDetailCardViewDelegate = GFUserDetailCardViewDelegateTop()
  private let bottomUserDetailCardViewDelegate = GFUserDetailCardViewDelegateBottom()
  
  var userDetailInformationView: GFUserDetailInformationView
  let topUserDetailCardView: GFUserDetailCardView
  let bottomUserDetailCardView: GFUserDetailCardView
  
  let verticalStackView: UIStackView = {
    let verticalStackView = UIStackView()
    verticalStackView.axis = .vertical
    verticalStackView.alignment = .fill
    verticalStackView.distribution = .fillProportionally
    verticalStackView.translatesAutoresizingMaskIntoConstraints = false
    verticalStackView.spacing = 10.0
    return verticalStackView
  }()
  
  let dateCreatedLabel: GFTitleLabel = {
    let dateCreatedLabel = GFTitleLabel(alignment: .center)
    dateCreatedLabel.text = "Created on May 7th, 1989"
    dateCreatedLabel.textAlignment = .center
    dateCreatedLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    dateCreatedLabel.textColor = .secondaryLabel
    dateCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateCreatedLabel
  }()
  
  
  init(user: GFUser) {
    self.user = user
    userDetailInformationView = GFUserDetailInformationView(user: self.user)
    topUserDetailCardView = GFUserDetailCardView(user: self.user, actionButtonTitle: "GitHub Profile", actionButtonColor: .systemPurple)
    bottomUserDetailCardView = GFUserDetailCardView(user: self.user, actionButtonTitle: "Get Followers", actionButtonColor: .systemGreen)
    
    topUserDetailCardView.delegate = topUserDetailCardViewDelegate
    bottomUserDetailCardView.delegate = bottomUserDetailCardViewDelegate
    
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
  }
  
  private func configure() {
    self.view.backgroundColor = .systemBackground
  }
  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    
    self.view.addSubview(dateCreatedLabel)
    self.view.addSubview(verticalStackView)
    self.verticalStackView.addArrangedSubview(userDetailInformationView)
    self.verticalStackView.addArrangedSubview(topUserDetailCardView)
    self.verticalStackView.addArrangedSubview(bottomUserDetailCardView)
  
    NSLayoutConstraint.activate([
      dateCreatedLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
      dateCreatedLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
      dateCreatedLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding),
      
      verticalStackView.bottomAnchor.constraint(equalTo: dateCreatedLabel.topAnchor, constant: -padding),
      verticalStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding),
      verticalStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: padding),
      verticalStackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -padding),
    ])
    
    
  }
  
  
  
  
}

