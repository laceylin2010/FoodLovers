////
////  GroceryViewController.swift
////  Project1
////
////  Created by Lacey Vu on 2/29/16.
////  Copyright © 2016 Lacey Vu. All rights reserved.
////
//
//import UIKit
//
//class GroceryViewController: UIViewController, Identity, UITableViewDelegate, UITableViewDataSource
//{
//    
//    @IBOutlet weak var tableView: UITableView!
//    
//    class func id() -> String
//    {
//        return "GroceryViewController"
//    }
//
//    override func viewDidLoad()
//    {
//        super.viewDidLoad()
//
//    }
//
//    override func didReceiveMemoryWarning()
//    {
//        super.didReceiveMemoryWarning()
//      
//    }
//    
//    func configureCell(indexPath: NSIndexPath) -> UITableViewCell
//    {
//        let cell = self.tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
//        let item = GroceryMemory.shared.objectAtIndex(indexPath.row)
//        cell.textLabel?.text = item.groceryItem
//        
//        return cell
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
//    {
//        return self.configureCell(indexPath)
//    }
//    
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
//    {
//        return GroceryMemory.shared.count()
//    }
//    
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
//    {
//        return true
//    }
//    
//
//}
