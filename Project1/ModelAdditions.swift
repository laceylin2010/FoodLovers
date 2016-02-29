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
            
            NSOperationQueue.mainQueue().addOperationWithBlock{ completion(success: true, attributions: attributions)
            }
            
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
            
            print(eachRecipe)
            
            guard let allRecipes = eachRecipe["matches"] as? [[String: AnyObject]] else { return }

            print(allRecipes.count)
            
            
            for recipe in allRecipes{
            
                print(recipe)
                
            let rating = recipe["rating"] as? Int ?? Int(API.shared.yEmptyString)
            let recipeName = recipe["recipeName"] as? String ?? API.shared.yEmptyString
            let ingredients = recipe["ingredients"] as? String ?? API.shared.yEmptyString //COMING BACK EMPTY
            guard let totalTime = recipe["totalTimeInSeconds"] as? Int else { return }
                print(totalTime)
                
            guard let imageurls = recipe["smallImageUrls"] as? [String] else { print("BAD..."); return }
                
            let recipeImage = imageurls.last ?? API.shared.yEmptyString
                
//                print(recipeImage)
                
            let allMatches = Matches(rating: rating!, recipeName: recipeName, ingredients: ingredients, recipeImage: recipeImage, totalTime: totalTime)
            
            matches.append(allMatches)
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, recipeMatches: matches)
            }
        }
        
    }
    
}
