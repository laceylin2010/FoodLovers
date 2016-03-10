//
//  ModelAdditions.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

extension Matches
{
    
    class func updateRecipes(searchTerm: String?, completion: (success: Bool, recipeMatches: [Matches]) -> ())
    {
        API.shared.searchRecipes(searchTerm) { (success, json) -> () in
            var matches = [Matches]()
            let eachRecipe = json

            
//            guard let attributions = eachRecipe["attribution"] as? [String : AnyObject] else { return }
            
//            let foodURL = attributions["url"] as? String ?? API.shared.yEmptyString
            
            guard let allRecipes = eachRecipe["matches"] as? [[String: AnyObject]] else { return }
            
            for recipe in allRecipes{
    
            let rating = recipe["rating"] as? Int ?? 0
            let id = recipe["id"] as? String ?? API.shared.yEmptyString
            let recipeName = recipe["recipeName"] as? String ?? API.shared.yEmptyString
//            let ingredients = recipe["ingredients"] as? [String] ?? []
//            let totalTime = recipe["totalTimeInSeconds"] as? Int ?? 0
            guard let imageurls = recipe["smallImageUrls"] as? [String] else { print("Not Recieving image..."); return }
            let recipeImage = imageurls.last ?? API.shared.yEmptyString
                
            let allMatches = Matches(rating: rating, recipeName: recipeName, ingredients: nil, recipeImage: recipeImage, totalTime: nil, url: nil, id: id)
            
            
            matches.append(allMatches)
                
            }
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, recipeMatches: matches)
            }
        }
        
    }
    
    class func updateRecipe(recipe: Matches, completion: (success: Bool, updateRecipeResult: Matches) -> ())
    {
        
        API.shared.getRecipe(recipe.id) { (success, json) -> () in
            
            
            let currentRecipe = json
            
            guard let source = currentRecipe["source"] as? [String : AnyObject] else { return }
            let url = source["sourceRecipeUrl"] as? String ?? API.shared.yEmptyString
            
            let ingredients = currentRecipe["ingredientLines"] as? [String] ?? []
            let totalTime = currentRecipe["totalTime"] as? Int ?? 0
            
            recipe.ingredients = ingredients
            recipe.totalTime = totalTime
            recipe.url = url
            
            NSOperationQueue.mainQueue().addOperationWithBlock { completion(success: true, updateRecipeResult: recipe)
            }
        }
    }
}
