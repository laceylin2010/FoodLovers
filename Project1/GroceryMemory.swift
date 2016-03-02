//
//  GroceryMemory.swift
//  Project1
//
//  Created by Lacey Vu on 3/1/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

class GroceryMemory: ItemList
{
    typealias Object = Grocery
    
    var itemList = [Object]()
    
    static let shared = GroceryMemory()
    
    private init()
    {

        guard let data = NSData(contentsOfURL: NSURL.archiveURL()) else
        {
            self.itemList = [Object]()
            return
        }
        
        guard let storedObject = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [Object] else {
            self.itemList = [Object]()
            return
        }
        
        self.itemList = storedObject
    }

    
}
