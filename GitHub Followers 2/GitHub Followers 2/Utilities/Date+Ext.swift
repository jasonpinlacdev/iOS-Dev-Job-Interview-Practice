//
//  Date+Ext.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/24/20.
//

import Foundation


extension Date {
    var convertedMonthYearFormat: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMMM yyyy"
            return dateFormatter.string(from: self)
        }
    }
}
