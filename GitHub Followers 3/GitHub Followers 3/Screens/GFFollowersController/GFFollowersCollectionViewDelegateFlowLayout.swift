//
//  GFFollowersCollectionViewDelegateFlowLayout.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/6/21.
//

import UIKit

class GFFollowersCollectionViewDelegateFlowLayout: NSObject {

  let numberOfItemsPerRow: CGFloat
  let spacingBetweenItems: CGFloat
  
  init(numberOfItemsPerRow: CGFloat, spacingBetweenItems: CGFloat) {
    self.numberOfItemsPerRow = numberOfItemsPerRow
    self.spacingBetweenItems = spacingBetweenItems
  }
  
}

extension GFFollowersCollectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let maxWidth = collectionView.bounds.width
    let availableWidth = maxWidth - (spacingBetweenItems * (numberOfItemsPerRow - 1))
    let itemWidth = (availableWidth/self.numberOfItemsPerRow)
  
    return CGSize(width: itemWidth, height: itemWidth)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
