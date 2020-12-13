//
//  ErrorMessage.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 10/28/20.
//

import Foundation

enum GFError: String, Error {
    case URLError = "Invalid URL."
    case clientError = "Unable to complete your request due to a client error. Please check your internet connection and try again."
    case serverError = "Invalid response from the server. Make sure the username requested is entered is correctly and try again."
    case MIMEError = "Wrong response MIME type recieved from the server. Please try again."
    case dataError = "Invalid data recieved from the server. Please try again."
    case decodeError = "The JSON data could not be decoded correctly for its Swift model type."
    case saveFavoritesError = "There was an error saving this user to favorites."
    case retrieveFavoritesError = "There was an error retrieving your favorites."
    case alreadyInFavoritesError = "This user already is in your favorites."
    case removeFavoriteError = "There was an error removing this user from favorites."
}

enum ResponseMIMEType: String {
    case applicationJSON = "application/json"
}
