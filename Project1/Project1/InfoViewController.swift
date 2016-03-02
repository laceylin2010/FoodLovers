//
//  InfoViewController.swift
//  Project1
//
//  Created by Lacey Vu on 2/29/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController, Identity, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var matches: Matches?
    
    var dataSource = [Matches](){
        didSet{
            self.tableView.reloadData()
        }
    }

    class func id() -> String
    {
        return "InfoViewController"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.navigationItem.title = matches?.recipeName
        setupRecipe()

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }


    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        var numberOfRows = Int()
        
        if section == 0 {
            numberOfRows = 1
        } else {
            if let matches = self.matches{
               numberOfRows = matches.ingredients.count
            }
        }
        
        return numberOfRows
    }
   
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        var header = String()
        
        if section == 1{
            header = "Ingredients"
        }
        
        return header
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell = UITableViewCell()
    
        if indexPath.section ==  0 {
            if let cell = self.tableView.dequeueReusableCellWithIdentifier("infoCell", forIndexPath: indexPath) as? InfoTableViewCell{
                if let matches = self.matches{
                    cell.matches = matches
                    cell.ratingLabel.text = "Rating: \(matches.rating)"
                    cell.timeLabel.text = "Total Time: \(matches.totalTime)"
                }
            }
        } else if indexPath.section == 1 {
            cell = self.tableView.dequeueReusableCellWithIdentifier("ingredientsCell", forIndexPath: indexPath)
            cell.textLabel?.text = matches?.ingredients[indexPath.row]
        }
        
        return cell

    }
    
    
    func setupRecipe()
    {
        if let match = matches{
            API.shared.getImage(match.recipeImage, completion: { (image) -> () in
                self.imageView.image = image

            })
        }
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 75
        }
        return tableView.rowHeight
    }

}

//extension InfoViewController
//{
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
//    {
//        if segue.identifier == WebViewController.id(){
//            if let webViewController = segue.destinationViewController as? WebViewController{
//                if let indexPath = self.instructionsLabel{
//                    webViewController.matches = matches
//                }
//                if let indexPath = self.tableView.indexPathForSelectedRow {
//                  let match = self.dataSource[indexPath.row]
//                   webViewController.matches = match
//
//                }
//            }
//            
//        }
//    }
//}
