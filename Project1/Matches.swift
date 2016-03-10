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
    var ingredients: [String]?
    let recipeImage: String
    var totalTime: Int?
    var url: String?
    let id: String

    
    init(rating: Int, recipeName: String, ingredients: [String]?, recipeImage: String, totalTime: Int?, url: String?, id: String)
    {
        self.rating = rating
        self.recipeName = recipeName
        self.ingredients = ingredients
        self.recipeImage = recipeImage
        self.totalTime = totalTime
        self.url = url
        self.id = id
    }
}