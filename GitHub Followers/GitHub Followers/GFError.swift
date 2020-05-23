//
//  GFError.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/21/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case usernameError = "This username created an invalid request. Please try again."
    case clientError = "Unable to handle your request. Check your internet connection."
    case serverError = "Invalid response from the server. Please try again."
    case dataError = "The data received from the server is invalid. Please try again."
    case decodeError = "The data failed to decode correctly. Please try again."
}

