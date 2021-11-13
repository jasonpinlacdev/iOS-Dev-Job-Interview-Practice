//
//  GFUserDetailController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/11/21.
//

import UIKit

class GFUserDetailController: UIViewController {
  
  let user: GFUser
  
  let userDetailInfoView: GFUserDetailInfoView
//  let userDetailCardViewTop: GFUserDetailCardView
//  let userDetailCardViewBottom: GFUserDetailCardView
//  let dateCreatedLabel: UILabel
  
  init(user: GFUser) {
    self.user = user
    self.userDetailInfoView = GFUserDetailInfoView(username: self.user.login, realName: self.user.name, location: self.user.location, bio: self.user.bio)
//    self.userDetailCardViewTop = GFUserDetailCardView(leftDetailCardElementSymbol: <#T##UIImage#>, leftDetailCardElementTitle: <#T##String#>, leftDetailCardElementValue: <#T##Int#>, rightDetailCardElementSymbol: <#T##UIImage#>, rightDetailCardElementTitle: <#T##String#>, rightDetailCardElementValue: <#T##Int#>, actionButtonTitle: <#T##String#>, actionButtonColor: <#T##UIColor#>)
//    self.userDetailCardViewBottom = GFUserDetailInfoView(username: <#T##String#>, realName: <#T##String#>, location: <#T##String#>, bio: <#T##String#>)
//    self.dateCreatedLabel = UILabel()
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
//    userDetailCardViewTop.delegate = self
//    userDetailCardViewBottom.delegate = self
  }
  
  private func configureLayout() {
    self.view.addSubview(userDetailInfoView)
//    self.view.addSubview(userDetailCardViewTop)
//    self.view.addSubview(userDetailCardViewBottom)
//    self.view.addSubview(dateCreatedLabel)
    
    NSLayoutConstraint.activate([
      userDetailInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      userDetailInfoView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor),
      userDetailInfoView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      userDetailInfoView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.5),
    ])
    
  }
  
  
  
}

