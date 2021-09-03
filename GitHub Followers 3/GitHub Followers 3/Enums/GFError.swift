//
//  GFError.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 9/1/21.
//

import Foundation

enum GFError: String, Error {
  case emptyUsernameError = "The username field is empty.\n Type in a username to search for its followers."
  case networkError = "An error occured during the network call.\n Check your internet connection."
  case httpURLReponseError = "Invalid http response returned from the network call.\n Make sure the searched username exists."
  case dataError = "No data was received from the network call."
  case jsonDecodingError = "An error occured while trying to decode the json data into instances in memory for the application to use."
}
