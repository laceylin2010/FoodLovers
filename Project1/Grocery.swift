//
//  File.swift
//  Project1
//
//  Created by Lacey Vu on 3/1/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

class Grocery: NSObject, NSCoding
{
    let groceryItem: String
    let identifier: String
    
    init(groceryItem: String, identifier: String)
    {
        self.groceryItem = groceryItem
        self.identifier = identifier
    }
    
 
    convenience required init?(coder aDecoder: NSCoder)
    {
        guard let groceryItem = aDecoder.decodeObjectForKey("groceryItem") as? String else
        {
            fatalError("Something is wrong")
        }
        
        guard let identifier = aDecoder.decodeObjectForKey("identifer") as? String else
        {
            fatalError("Something is wrong with the id")
        }
        
        self.init(groceryItem: groceryItem, identifier: identifier)
    }
    
    func encodeWithCoder(aCoder: NSCoder)
    {
        aCoder.encodeObject(self.groceryItem, forKey: "groceryItem")
        aCoder.encodeObject(self.identifier, forKey: "identifier")
    }
    
    
}
