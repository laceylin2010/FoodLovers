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
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    var matches: Matches?

    class func id() -> String
    {
        return "InfoViewController"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.setupRecipe()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
       

    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    
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


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let reuseCell = self.tableView.dequeueReusableCellWithIdentifier("ingredientsCell", forIndexPath: indexPath)
        let ingredientCell = self.matches?.ingredients[indexPath.row]
        reuseCell.textLabel?.text = ingredientCell
        return reuseCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        guard let ingridients = self.matches?.ingredients else { return 0 }
        return ingridients.count
    }
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
//    {
//        //
//    }
    
    func setupRecipe()
    {
        if let match = matches{
            self.ratingLabel.text = String("Rating: \(match.rating)")
            self.timeLabel.text = String("Total Time: \(match.totalTime)")
            self.instructionsLabel.text = String("See Instructions ->\(match.url)")
            API.shared.getImage(match.recipeImage, completion: { (image) -> () in
                self.imageView.image = image
            })
        }

    }
    

}
