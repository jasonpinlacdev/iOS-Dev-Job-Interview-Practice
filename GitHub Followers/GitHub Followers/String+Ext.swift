//
//  String+Ext.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/27/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation


extension String {
    
    func convertToDateObject() -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = .current
        return formatter.date(from: self)
    }
}
