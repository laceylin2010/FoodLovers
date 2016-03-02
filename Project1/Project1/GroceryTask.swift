//
//  ToDoMemory.swift
//  Project1
//
//  Created by Lacey Vu on 3/1/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import Foundation

protocol ItemList: class
{
    typealias Object: Grocery, NSCoding
    
    var itemList: [Object] {set get}
    
    func add(object: Object)
    func remove(object: Object)
    func removeObjectAtIndexPath(index: NSIndexPath)
    func removeAllTasks()
    func allTasks() -> [Object]
    func save()
    func objectAtIndex(index: Int) -> Object?
    func count() -> Int
}

extension ItemList
{
    func add(object: Object)
    {
        self.itemList.append(object)
        self.save()
    }
    
    func remove(object: Object)
    {
        self.itemList = self.itemList.filter({ (otherObject) -> Bool in
            return object.identifier != otherObject.identifier
        })
    }
    func removeObjectAtIndexPath(index: NSIndexPath)
    {
        self.itemList.removeAtIndex(index.row)
        self.save()
    }
    
    func removeAllTasks()
    {
        self.itemList.removeAll()
        self.save()
    }
    
    func allTasks() -> [Object]
    {
        return self.itemList
    }
    
    func save()
    {
        NSKeyedArchiver.archiveRootObject(self.itemList, toFile: String.archivePath())

    }
    
    func objectAtIndex(index: Int) -> Object?
    {
       return self.itemList[index]
    }
    
    func count() -> Int
    {
        return self.itemList.count
    }
    
}

