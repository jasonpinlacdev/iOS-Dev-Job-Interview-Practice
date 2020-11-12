//
//  GFFollowersDelegate.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/11/20.
//

import UIKit


class GFFollowersDelegate: NSObject {
    
    var followersController: GFFollowersController
    
    init(viewController: GFFollowersController){
        self.followersController = viewController
        super.init()
    }
}

extension GFFollowersDelegate: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        let cellItemWidth = (screenWidth/3.0) - 20.0
        let cellItemHeight = cellItemWidth * 1.25
        
        return CGSize(width: cellItemWidth, height: cellItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = followersController.diffableDatasource.itemIdentifier(for: indexPath) else { fatalError("Failed to get item identifier for selected item at index path") }
        print(item.login)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard followersController.hasMoreFollowers else { return }
        
        let contentHeight = scrollView.contentSize.height
        let contentOffset = scrollView.contentOffset.y
        let scrollViewFrameHeight = scrollView.frame.size.height
        if (scrollViewFrameHeight + contentOffset) > (contentHeight - 100)  {
            
            followersController.view.isUserInteractionEnabled = false
            followersController.showLoadingView()
            
            GFNetworkManager.shared.getFollowers(for: followersController.username, page: followersController.nextPageOfFollowersToGet) { [weak self] result in
                switch result {
                case .failure:
                    self?.followersController.dismissLoadingView()
                case .success(let newFollowers):
                    if newFollowers.count < 100 { self?.followersController.hasMoreFollowers = false }
                    self?.followersController.followers.append(contentsOf: newFollowers)
                    self?.followersController.diffableDatasource.updateDataSource(with: (self?.followersController.followers)!)
                    self?.followersController.nextPageOfFollowersToGet += 1
                    
                    self?.followersController.dismissLoadingView()
                    DispatchQueue.main.async {
                        self?.followersController.view.isUserInteractionEnabled = true
                    }
                }
            }
        }
        
    }
    
    
}
