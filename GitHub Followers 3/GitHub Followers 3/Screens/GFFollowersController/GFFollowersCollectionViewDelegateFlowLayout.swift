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
    if followersController.hasMoreFollowers && (scrollView.contentOffset.y + scrollView.bounds.height >= scrollView.contentSize.height - 100) {
      
      followersController.currentPageOfFollowers += 1
      let nextPage = followersController.currentPageOfFollowers
      
      followersController.showLoadingView(onView: followersController.view) { [weak self] in
        guard let self = self else { return }
        
        GFNetworkManager.shared.getFollowers(for: self.followersController.username, page: nextPage) { result in
          
          DispatchQueue.main.async {
            self.followersController.removeLoadingView {
              
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
        
      }
      
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
    guard let diffableDataSource = collectionView.dataSource as? GFFollowersCollectionViewDiffableDataSource else { return }
    guard let follower = diffableDataSource.itemIdentifier(for: indexPath) else { return }
    let followerUsername = follower.login
    
    followersController.showLoadingView(onView: followersController.view, completionHandler: {
      GFNetworkManager.shared.getUser(for: followerUsername) { [weak self] result in
        DispatchQueue.main.async {
          self?.followersController.removeLoadingView(completionHandler: {
            switch result {
            case .success(let user):
              let userDetailController = GFUserDetailController(user: user)
              self?.followersController.present(userDetailController, animated: true, completion: nil)
            case .failure(let error):
              self?.followersController.presentGFAlertController(alertTitle: error.errorTitle, alertMessage: error.errorMessageDescription, alertButtonText: "Dismiss")
            }
          })
        }
      }
    })
  }

}
