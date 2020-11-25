//
//  String+Ext.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/24/20.
//

import Foundation


extension String {
    
    var convertedToDateObject: Date? {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.timeZone = .current
            return dateFormatter.date(from: self)
        }
    }
}
