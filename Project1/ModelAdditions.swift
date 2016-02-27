//
//  ModelAdditions.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension Attributions
{
    
    class func updateRecipes(searchTerm: String?, completion: (success: Bool, attributions : [Attributions]) -> ())
    {
        API.shared.getRecipes(searchTerm) { (success, json) -> () in
            var attributions = [Attributions]()
            let eachRecipe = json
            
            guard let attribution = eachRecipe["attribution"] as? [String: AnyObject] else { return }
            print(attribution)
            let url = attribution["url"] as? String ?? API.shared.yEmptyString
            
            let allAttributions = Attributions(url: url)
            
            attributions.append(allAttributions)
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
 
            })
            
        }

    }

}

extension Matches
{
 
    class func updateRecipes(searchTerm: String?, completion: (success: Bool, recipeMatches: [Matches]) -> ())
    {
        API.shared.getRecipes(searchTerm) { (success, json) -> () in
            var matches = [Matches]()
            let eachRecipe = json
            
            
            guard let recipeMatches = eachRecipe["matches"] as? [String: AnyObject] else { return }
            print(matches)
            let rating = recipeMatches["rating"] as? Int ?? Int(API.shared.yEmptyString)
            let recipeName = recipeMatches["recipeName"] as? String ?? API.shared.yEmptyString
            let ingredients = recipeMatches["ingredients"] as? String ?? API.shared.yEmptyString
            let recipeImage = recipeMatches["image"] as? String ?? API.shared.yEmptyString
            
            let allMatches = Matches(rating: rating, recipeName: recipeName, ingredients: ingredients, recipeImage: recipeImage, attributions: attributions)
            
            
            NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                //
            })
        }
        
    }

    
    
}
