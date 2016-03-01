//
//  GroceryViewController.swift
//  Project1
//
//  Created by Lacey Vu on 2/29/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class GroceryViewController: UIViewController, Identity
{
    
    var searchArray = [Matches](){
        didSet{
            //
        }
    }
    
    class func id() -> String
    {
        return "GroceryViewController"
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
