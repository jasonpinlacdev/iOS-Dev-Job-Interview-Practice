//
//  UITableView+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 6/4/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit


extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
