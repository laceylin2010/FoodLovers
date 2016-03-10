//
//  SearchRecipeCell.swift
//  Project1
//
//  Created by Lacey Vu on 3/1/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

//
//  HomeImageView.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SearchViewCell: UICollectionViewCell, Identity
{
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
 
    
    var matches: Matches?{
        didSet{
            imageAppear()
        }
    }
    
    class func id() -> String
    {
        return "SearchViewController"
    }
    
    func imageAppear()
    {
        if let matches =  matches{
            API.shared.getImage(matches.recipeImage, completion: { (image) -> () in
                self.imageView.image = image
                self.nameLabel.text = matches.recipeName
                
            })
            
        }
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.imageView.image = nil
    }

}


