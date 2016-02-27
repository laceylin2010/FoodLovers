//
//  ViewController.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Identity
{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!

    var dataSource = [Matches]() {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    class func id() -> String
    {
        return "HomeViewController"
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        Matches.updateRecipes(nil) { (success, recipes) -> () in
            print("yay!")
        }
        
    }
    
    

    override func didReceiveMemoryWarning()
    {
    
        super.didReceiveMemoryWarning()

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let homeCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("RecipeCollectionViewCell", forIndexPath: indexPath) as! RecipeCollectionViewCell
        let currentImageCell = self.dataSource[indexPath.row]
        homeCell.matches = currentImageCell
        
        return homeCell
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataSource.count
        
    }
    
    
}

