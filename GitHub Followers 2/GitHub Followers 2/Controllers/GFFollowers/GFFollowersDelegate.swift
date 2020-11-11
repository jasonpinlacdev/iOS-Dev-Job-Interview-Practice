//
//  GFFollowersDelegate.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/11/20.
//

import UIKit


class GFFollowersDelegate: NSObject {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, GFFollower>?
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
        guard let dataSource = dataSource else { fatalError("the delegates datasource reference is nil and missing")}
        guard let item = dataSource.itemIdentifier(for: indexPath) else { fatalError("Failed to get item identifier for selected item at index path") }
        print(item.login)
    }
}
