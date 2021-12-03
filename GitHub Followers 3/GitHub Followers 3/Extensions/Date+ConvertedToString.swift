//
//  Date+ConvertedToString.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/19/21.
//

import Foundation

extension Date {

//  func convertedToString() -> String {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MMM d, yyyy"
//    return dateFormatter.string(from: self)
//  }
  
  func convertedToString() -> String {
    return self.formatted(date: .abbreviated, time: .omitted)
  }
  
}
