//
//  FileManager+Ext.swift
//  GitHub Followers 2
//
//  Created by Jason Pinlac on 11/25/20.
//

import Foundation

extension FileManager {
    static var documentDirectoryURL: URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
}
