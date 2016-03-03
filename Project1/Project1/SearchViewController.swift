//
//  SearchViewController.swift
//  Project1
//
//  Created by Lacey Vu on 2/29/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UISearchBarDelegate, Identity
{

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var matches: Matches?
    
    var dataSource = [Matches](){
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    class func id() -> String
    {
        return "SearchViewController"
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView.collectionViewLayout = SearchCollectionFlowLayout()
     
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let reuseCell = self.collectionView.dequeueReusableCellWithReuseIdentifier("searchCell", forIndexPath: indexPath) as! SearchViewCell
        let searchRecipe = self.dataSource[indexPath.row]
        reuseCell.matches = searchRecipe
        
        return reuseCell
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return self.dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        self.performSegueWithIdentifier("InfoViewController", sender: nil)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if let searchText = searchBar.text {
            Matches.updateRecipes(searchText) { (success, recipeMatches) -> () in
                self.dataSource = recipeMatches
            }
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        if self.searchBar.isFirstResponder(){
            self.searchBar.resignFirstResponder()
        }
    }
    
}

extension SearchViewController
{
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == InfoViewController.id(){
            if let infoViewController = segue.destinationViewController as? InfoViewController{
                if let indexPath = self.collectionView.indexPathsForSelectedItems()?.first{
                    let matches = self.dataSource[indexPath.row]
                    infoViewController.matches = matches
                }
            }
        }
    }
}
