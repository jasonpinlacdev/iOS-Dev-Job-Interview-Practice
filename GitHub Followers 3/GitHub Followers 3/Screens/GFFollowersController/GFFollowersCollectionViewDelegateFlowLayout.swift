//
//  GFFollowersCollectionViewDelegateFlowLayout.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/6/21.
//

import UIKit

class GFFollowersCollectionViewDelegateFlowLayout: NSObject {
  
  private weak var followersController: GFFollowersController!
  
  private let numberOfItemsPerRow: CGFloat
  private let spacingBetweenItems: CGFloat
  
  init(numberOfItemsPerRow: CGFloat, spacingBetweenItems: CGFloat, followersController: GFFollowersController) {
    self.numberOfItemsPerRow = numberOfItemsPerRow
    self.spacingBetweenItems = spacingBetweenItems
    self.followersController  = followersController
  }
  
}

extension GFFollowersCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxWidth = collectionView.bounds.width
    let availableWidth = maxWidth - (spacingBetweenItems * (numberOfItemsPerRow - 1))
    let itemWidth = (availableWidth/self.numberOfItemsPerRow)
    
    return CGSize(width: itemWidth, height: itemWidth * 1.33)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    guard followersController.hasMoreFollowers && (scrollView.contentOffset.y + scrollView.bounds.height >= scrollView.contentSize.height - 100) else { return }
    followersController.currentPageOfFollowers += 1
    let nextPage = followersController.currentPageOfFollowers
    
    followersController.showLoadingView()
    GFNetworkManager.shared.getFollowers(for: self.followersController.username, page: nextPage) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.followersController.removeLoadingView()
        switch result {
        case .success(let followersOfPage):
          self.followersController.followersOfCurrentPage = followersOfPage
          self.followersController.allFollowersSoFar.append(contentsOf: self.followersController.followersOfCurrentPage)
          DispatchQueue.main.async {
            self.followersController.collectionViewDiffableDataSource.applySnapshotUpdate(with: self.followersController.allFollowersSoFar)
          }
        case .failure(_):
          return
        }
      }
    }
  }
  
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let diffableDataSource = collectionView.dataSource as? GFFollowersCollectionViewDiffableDataSource else { return }
    guard let follower = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    
    followersController.showLoadingView()
    GFNetworkManager.shared.getUser(for: follower.login) { [weak self] result in
      guard let self = self else { return }
      DispatchQueue.main.async {
        self.followersController.removeLoadingView()
        switch result {
        case .success(let user):
          
          let userDetailController = GFUserDetailController(user: user)
          
          userDetailController.onActionButtonTappedToGetFollowers = { (username, followers) in
            DispatchQueue.main.async {
              self.followersController.title = "\(username)'s Followers"
              self.followersController?.username = username
              self.followersController?.followersOfCurrentPage = followers
              self.followersController?.allFollowersSoFar = followers
              self.followersController?.currentPageOfFollowers = 1
              diffableDataSource.applySnapshotUpdate(with: followers, completionHandler: nil)
              self.followersController?.checkForEmptyState()
              self.followersController.navigationItem.rightBarButtonItem?.image = GFPersistenceManager.shared.isInFavorites(username) ? GFSymbol.starFill.image : GFSymbol.star.image
              self.followersController.dismiss(animated: true, completion: nil)
            }
          }
          
          let userDetailNavigationController = UINavigationController(rootViewController: userDetailController)
          let userDetailNavigationBarAppearance = UINavigationBarAppearance()
          userDetailNavigationBarAppearance.shadowColor = nil
          userDetailNavigationBarAppearance.backgroundColor = .systemBackground
          userDetailNavigationController.navigationBar.standardAppearance = userDetailNavigationBarAppearance
          userDetailNavigationController.navigationBar.compactAppearance = userDetailNavigationBarAppearance
          userDetailNavigationController.navigationBar.scrollEdgeAppearance = userDetailNavigationBarAppearance
          
          self.followersController.present(userDetailNavigationController, animated: true, completion: nil)
          
        case .failure(let error):
          self.followersController.presentGFAlertController(alertTitle: error.errorTitle, alertMessage: error.errorMessageDescription, alertButtonText: "Dismiss")
        }
      }
    }
    
  }
  
  
  
}
