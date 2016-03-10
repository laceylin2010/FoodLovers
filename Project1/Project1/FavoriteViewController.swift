//
//  FavoriteViewController.swift
//  FoodLover
//
//  Created by Lacey Vu on 3/9/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController, Identity
{
    var matches: Matches?
    
    class func id() -> String
    {
        return "FavoriteViewController"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()

    }
    
}
