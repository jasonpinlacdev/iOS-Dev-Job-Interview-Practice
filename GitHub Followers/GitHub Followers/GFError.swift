//
//  ErrorMessage.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/5/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import Foundation


enum GFError: String, Error {
    
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid HTTP response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
    case invalidDecode = "Failed decode the data. Please try again."
    
}

