//
//  Extension+FileManager.swift
//  DemoGCD
//
//  Created by Le Toan on 8/10/20.
//  Copyright © 2020 Le Toan. All rights reserved.
//

import Foundation

extension FileManager {
    static func documentPath() -> String {
        return NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last!
    }
    
    static func documentURL() -> URL {
        return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last!
    }
    
    static func musicPath() -> String {
        return self.documentPath().appending("/music")
    }
    
    static func musicURL() -> URL {
        return self.documentURL().appendingPathComponent("music")
    }
    
    static func createDownloadDirIfNeeded() {
        var isDirectoryOutput: ObjCBool = false
        let pointer = UnsafeMutablePointer<ObjCBool>.allocate(capacity: 1)
        pointer.initialize(from: &isDirectoryOutput, count: 1)
        
        if FileManager.default.fileExists(atPath: self.musicPath(), isDirectory: pointer) == false {
            try? FileManager.default.createDirectory(at: self.musicURL(), withIntermediateDirectories: true, attributes: nil)
        }
    }
}
