//
//  GFError.swift
//  GitHub Followers 3
//
//  Created by Jason Pinlac on 11/4/21.
//

import Foundation


enum GFError: Error {
  case emptyUsername
  case invalidUsername
  case localError
  case serverError
  case dataError
  case dataDecodingError
  case avatarImageDownloadError // <-- this error here is just a placeholder for our result type when making the async network call. I don't use this error case when presenting the GFAlertController
  case getUserError
  case gitHubURLError
  
  var errorTitle: String {
    switch self {
    case .emptyUsername:
      return "Empty Username Error"
    case .localError:
      return "Invalid Connection Error"
    case .serverError:
      return "Invalid Server Response Error"
    case .dataError:
      return "Invalid Data Error"
    case .dataDecodingError:
      return "Invalid Data Decoding Error"
    case .avatarImageDownloadError:
      return "Avatar Image Download Error"
    case .invalidUsername:
      return "Invalid Username Error"
    case .getUserError:
      return "User Detail Retrieval Error"
    case .gitHubURLError:
      return "Invalid GitHub Repostitory URL"
    }
  }
  
  var errorMessageDescription: String {
    switch self {
    case .emptyUsername:
      return "The username you entered is empty. Try again."
    case .localError:
      return "Unable to complete the request. Please check your internet connection."
    case .serverError:
      return "The server response for the username provided is invalid. Try again."
    case .dataError:
      return "The data retrieved from the request is invalid."
    case .dataDecodingError:
      return "The data retrieved from the request could not properly be decoded to followers."
    case .avatarImageDownloadError:
      return "Failed to retrieve follower avatar image."
    case .invalidUsername:
      return "The username you entered is an invalid entry. Try again."
    case .getUserError:
      return "Could not retrieve the details on the user. Try again."
    case .gitHubURLError:
      return "The GitHub Repository for the user could not be retrieved. Try again."
    }
  }
  
}
