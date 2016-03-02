//
//  ingredientsCell.swift
//  Project1
//
//  Created by Lacey Vu on 2/29/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell, Identity
{
    
    
    var matches: Matches?
    
    class func id() -> String
    {
        return "IngredientTableViewCell"
    }
    

}


