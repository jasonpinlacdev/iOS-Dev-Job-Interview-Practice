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
  let userDetailCardViewTop: GFUserDetailCardView
  let userDetailCardViewBottom: GFUserDetailCardView
  let dateCreatedLabel: UILabel
  
  init(user: GFUser) {
    self.user = user
    super.init(nibName: nil, bundle: nil)
    
    self.userDetailInfoView = GFUserDetailInfoView(username: <#T##String#>, realName: <#T##String#>, location: <#T##String#>, bio: <#T##String#>)
    self.userDetailCardViewTop = GFUserDetailCardView(leftDetailCardElementSymbol: <#T##UIImage#>, leftDetailCardElementTitle: <#T##String#>, leftDetailCardElementValue: <#T##Int#>, rightDetailCardElementSymbol: <#T##UIImage#>, rightDetailCardElementTitle: <#T##String#>, rightDetailCardElementValue: <#T##Int#>, actionButtonTitle: <#T##String#>, actionButtonColor: <#T##UIColor#>, actionButtonSelector: <#T##Selector#>)
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
    self.view.addSubview(userDetailInfoView)
    self.view.addSubview(userDetailCardViewTop)
    self.view.addSubview(userDetailCardViewBottom)
    self.view.addSubview(dateCreatedLabel)
    
  }
  
  
  
}
