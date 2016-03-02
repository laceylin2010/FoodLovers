//
//  InfoTableViewCell.swift
//  Project1
//
//  Created by Lacey Vu on 3/2/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell, Identity
{
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    var matches: Matches?


    class func id() -> String
    {
        return "InfoTableViewCell"
    }

    
    func setupInfo()
    {

        
    }
}



