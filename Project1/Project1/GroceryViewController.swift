////
////  GroceryViewController.swift
////  Project1
////
////  Created by Lacey Vu on 2/29/16.
////  Copyright © 2016 Lacey Vu. All rights reserved.
////
//
import UIKit

class GroceryViewController: UIViewController, Identity, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var ingredientTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    class func id() -> String
    {
        return "GroceryViewController"
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
      
    }
    
  
    @IBAction func addButton(sender: UIButton)
    {
        guard let title = self.ingredientTextField.text else { return }
        let newGroceryItem = Grocery(groceryItem: title)
        GroceryMemory.shared.add(newGroceryItem)
        self.tableView.reloadData()

    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("taskCell", forIndexPath: indexPath)
        let item = GroceryMemory.shared.objectAtIndex(indexPath.row)
        cell.textLabel?.text = item?.groceryItem

        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return GroceryMemory.shared.count()
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete{
            GroceryMemory.shared.removeObjectAtIndexPath(indexPath)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
        
    
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        if self.ingredientTextField.isFirstResponder(){
            self.ingredientTextField.resignFirstResponder()
        }
    }


}
