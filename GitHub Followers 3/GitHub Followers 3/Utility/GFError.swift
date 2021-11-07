//
//  GFError.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/4/21.
//

import Foundation


enum GFError: Error {
  case emptyUsername
  case localError
  case serverError
  case dataError
  case dataDecodingError
  
  
  var errorTitle: String {
    switch self {
    case .emptyUsername:
      return "Empty Username Error"
    case .localError:
      return "Invalid Connection Error"
    case .serverError:
      return "Invalid Username Error"
    case .dataError:
      return "Invalid Data Error"
    case .dataDecodingError:
      return "Invalid Data Decoding Error"
    }
  }
  
  var errorMessageDescription: String {
    switch self {
    case .emptyUsername:
      return "The username you entered is empty. Try again."
    case .localError:
      return "Unable to complete the request. Please check your internet connection."
    case .serverError:
      return "Unable to find the account for the username provided. Please enter a valid username."
    case .dataError:
      return "The data retrieved from the request is invalid."
    case .dataDecodingError:
      return "The data retrieved from the request could not properly be decoded to followers."
    }
  }
}