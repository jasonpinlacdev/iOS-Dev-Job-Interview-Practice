//
//  String+ConvertToDate.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/19/21.
//

import Foundation

extension String {
  
  func convertedToDate() -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ" // <- This is the date format of the string being converted to a Date object. If the string is not in this format, the the dateFormatter.date(from: string) returns an optional with a nil value
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = .current // <- uses the time zone of this system
    return dateFormatter.date(from: self)
  }
  
}


