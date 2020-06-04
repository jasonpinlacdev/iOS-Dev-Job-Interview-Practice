//
//  Constants.swift
//  GitHub Followers
//
//  Created by Jason Pinlac on 5/22/20.
//  Copyright © 2020 Jason Pinlac. All rights reserved.
//

import UIKit

enum SFSymbolsImages {
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let folder = UIImage(systemName: "folder")
    static let textAlignLeft = UIImage(systemName: "text.alignleft")
    static let heart = UIImage(systemName: "heart")
    static let persons = UIImage(systemName: "person.2")
}


enum Images {
    static let avatarPlaceholder = UIImage(named: "avatar-placeholder")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
    static let ghLogo = UIImage(named: "gh-logo")
}


enum ScreenSize {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}


enum DeviceType {
    static let idiom = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale = UIScreen.main.scale
    
    static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
    static let isiPhone8Zoomed  = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = idiom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX = idiom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXsMaxAndXr = idiom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad = idiom == .phone && ScreenSize.maxLength == 1024.0
    
    static func isiPhoneXAspectRation() -> Bool {
        return isiPhoneX || isiPhoneXsMaxAndXr
    }
}
