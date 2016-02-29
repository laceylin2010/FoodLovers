//
//  Matches.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class Matches
{
    let rating: Int
    let recipeName: String
    let ingredients: String
    let recipeImage: String

    
    init(rating: Int, recipeName: String, ingredients: String, recipeImage: String)
    {
        self.rating = rating
        self.recipeName = recipeName
        self.ingredients = ingredients
        self.recipeImage = recipeImage
    }
}