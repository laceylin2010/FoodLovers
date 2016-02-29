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
    
    var matches: Matches?

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
        loadRecipeImages()

    }

    
    override func didReceiveMemoryWarning()
    {
    
        super.didReceiveMemoryWarning()

    }
    
    func loadRecipeImages()
    {
        
        Matches.updateRecipes(nil) { (success, recipeMatches) -> () in
            print("yay!")
                self.dataSource = recipeMatches
        }

        matches?.recipeImage
    
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
        print("Collection View Count: \(dataSource.count)")
        return self.dataSource.count
        
    }
    
    
}

