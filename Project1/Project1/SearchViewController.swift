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
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        if let searchText = searchBar.text {
            Matches.updateRecipes(searchText) { (success, recipeMatches) -> () in
                self.dataSource = recipeMatches
                
            }
        }
    }
    
}
