//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation


extension Date {
    
    func convertToMMMdYYYYStringFormat() -> String {
        let formatter = DateFormatter()
//        formatter.dateFormat = "MMM d, YYYY"
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
    
}
