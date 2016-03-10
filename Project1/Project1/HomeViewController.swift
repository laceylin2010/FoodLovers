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
        self.collectionView.collectionViewLayout = SearchCollectionFlowLayout(columns: 1, imageHeghtMultiplier: 0.7)

    }

    
    override func didReceiveMemoryWarning()
    {
    
        super.didReceiveMemoryWarning()

    }
    
    func loadRecipeImages()
    {
        
        Matches.updateRecipes(nil) { (success, recipeMatches) -> () in
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

        return self.dataSource.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let matches = self.dataSource[indexPath.row]
        
        Matches.updateRecipe(matches, completion: { (success, updateRecipeResult) -> () in
            if success {
                self.performSegueWithIdentifier("InfoViewController", sender: updateRecipeResult)
            }
        })
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        guard let collectionView = self.collectionView else {return}
        guard let visibleCells = collectionView.visibleCells() as? [RecipeCollectionViewCell] else { return }
        for parallaxCell in visibleCells {
            let yOffset = ((collectionView.contentOffset.y - parallaxCell.frame.origin.y) / ImageHeight * 0.5) * OffsetSpeed
            parallaxCell.offset(CGPointMake(0.0, yOffset))
        }
    }
    
}

extension HomeViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == InfoViewController.id(){
            if let infoViewController = segue.destinationViewController as? InfoViewController{
                    infoViewController.matches = sender as! Matches
                } else {
            }
        }
    }
}


