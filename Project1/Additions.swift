//
//  Item.swift
//  Project1
//
//  Created by Lacey Vu on 3/1/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension String {
    static func archivePath() -> String {
        guard let archivePath = NSURL.archiveURL().path else { fatalError("Can't get archive path. Error origin: \(__FUNCTION__)") }
        return archivePath
    }
}

extension NSURL {
    class func documentsDirectory() -> NSURL {
        guard let directory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first else { fatalError("Error getting documents directory. Error Origin: \(__FUNCTION__)") }
        
        return directory
    }
    class func archiveURL(storeId: String = "archive" ) -> NSURL {
        return self.documentsDirectory().URLByAppendingPathComponent(storeId)
    }
    
    
}