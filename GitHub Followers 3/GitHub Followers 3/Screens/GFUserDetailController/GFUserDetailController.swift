//
//  GFUserDetailController.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/11/21.
//

import UIKit
import SafariServices

class GFUserDetailController: UIViewController {
  
  private let user: GFUser
  
  var userDetailInformationView: GFUserDetailInformationView
  let topUserDetailCardView: GFUserDetailCardView
  let bottomUserDetailCardView: GFUserDetailCardView
  let dateCreatedLabel: GFTitleLabel = {
    let dateCreatedLabel = GFTitleLabel(alignment: .center)
    dateCreatedLabel.textAlignment = .center
    dateCreatedLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    dateCreatedLabel.textColor = .secondaryLabel
    dateCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
    return dateCreatedLabel
  }()
  
  var onActionButtonTappedToGetFollowers: ((String, [GFFollower]) -> Void)?
  
  
  init(user: GFUser) {
    self.user = user
    userDetailInformationView = GFUserDetailInformationView(user: self.user)
    topUserDetailCardView = GFUserDetailCardView(leftElementSymbol: GFSymbol.repos.image, leftElementName: "Public Repos", leftElementValue: self.user.publicRepos, rightElementSymbol: GFSymbol.gists.image, rightElementName: "Public Gists", rightElementValue: self.user.publicGists, actionButtonTitle: "GitHubProfile", actionButtonColor: .systemPurple, actionButtonImage: GFSymbol.person.image!)
    bottomUserDetailCardView = GFUserDetailCardView(leftElementSymbol: GFSymbol.following.image, leftElementName: "Following", leftElementValue: self.user.following, rightElementSymbol: GFSymbol.followers.image, rightElementName: "Followers", rightElementValue: self.user.followers, actionButtonTitle: "Get Followers", actionButtonColor: .systemGreen, actionButtonImage: GFSymbol.persons.image!)
    super.init(nibName: nil, bundle: nil)
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
    configureLayout()
    configureUserDetailCardsViewsOnActionButtonTapped()
  }
  
  
  private func configure() {
    self.view.backgroundColor = .systemBackground
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeButtonTapped))
    navigationItem.largeTitleDisplayMode = .never
    let dateCreatedLabelText: String = user.createdAt.convertedToDate()?.convertedToString() ?? "GitHub since N/A"
    dateCreatedLabel.text = "GitHub Since \(dateCreatedLabelText)"
  }
  
  
  private func configureLayout() {
    let padding: CGFloat = 10.0
    
    userDetailInformationView.translatesAutoresizingMaskIntoConstraints = false
    topUserDetailCardView.translatesAutoresizingMaskIntoConstraints = false
    bottomUserDetailCardView.translatesAutoresizingMaskIntoConstraints = false
    
    self.view.addSubview(userDetailInformationView)
    self.view.addSubview(topUserDetailCardView)
    self.view.addSubview(bottomUserDetailCardView)
    self.view.addSubview(dateCreatedLabel)
  
    NSLayoutConstraint.activate([
      userDetailInformationView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
      userDetailInformationView.heightAnchor.constraint(equalToConstant: 250),
      userDetailInformationView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
      userDetailInformationView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),

      topUserDetailCardView.topAnchor.constraint(equalTo: userDetailInformationView.bottomAnchor, constant: padding),
      topUserDetailCardView.heightAnchor.constraint(equalToConstant: 175),
      topUserDetailCardView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
      topUserDetailCardView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
      
      bottomUserDetailCardView.heightAnchor.constraint(equalTo: topUserDetailCardView.heightAnchor),
      bottomUserDetailCardView.topAnchor.constraint(equalTo: topUserDetailCardView.bottomAnchor, constant: padding),
      bottomUserDetailCardView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
      bottomUserDetailCardView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
      
      dateCreatedLabel.heightAnchor.constraint(equalToConstant: 25),
      dateCreatedLabel.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
      dateCreatedLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor),
      dateCreatedLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
    ])
  }
  
  
  @objc private func closeButtonTapped() {
    self.dismiss(animated: true, completion: nil)
  }
  
  
  private func configureUserDetailCardsViewsOnActionButtonTapped() {
    topUserDetailCardView.onActionButtonTapped = {
      // implement the safari view controller here
      guard let url = URL(string: self.user.htmlURL) else {
        self.presentGFAlertController(alertTitle: GFError.gitHubURLError.errorTitle, alertMessage: GFError.gitHubURLError.errorMessageDescription, alertButtonText: "Dismiss")
        return
      }
      let safariViewController = SFSafariViewController(url: url)
      safariViewController.preferredControlTintColor = .systemGreen
      self.present(safariViewController, animated: true, completion: nil)
    }
    
    bottomUserDetailCardView.onActionButtonTapped = {
      self.showLoadingView()
      GFNetworkManager.shared.getFollowers(for: self.user.login) { result in
        DispatchQueue.main.async {
          self.removeLoadingView()
          switch result {
          case .success(let followers):
            self.onActionButtonTappedToGetFollowers?(self.user.login, followers)
          case .failure(let error):
           self.presentGFAlertController(alertTitle: error.errorTitle, alertMessage: error.errorMessageDescription, alertButtonText: "Dismiss")
          }
        }
      }
    }
  }
  
}


