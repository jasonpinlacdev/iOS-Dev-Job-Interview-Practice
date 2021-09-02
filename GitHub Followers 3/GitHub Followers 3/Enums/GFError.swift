//
//  GFError.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import Foundation

enum GFError: String, Error {
  case networkError = "An error occured during the network call. Check your internet connection."
  case httpReponseError = "Invalid http response returned from the network call."
  case dataError = "Invalid data received from the network call."
  case jsonDecodingError = "An error occured while trying to decode the json data into instances in memory for the application to use."
}
