//
//  HomeImageView.swift
//  Project1
//
//  Created by Lacey Vu on 2/26/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class RecipeCollectionViewCell: UICollectionViewCell, Identity
{
    
    @IBOutlet weak var imageView: UIImageView!
    
    var matches: Matches?{
        didSet{
            imageAppear()
        }
    }
    
    class func id() -> String
    {
        return "RecipeCollectionViewCell"
    }
    
    func imageAppear()
    {
        if let matches =  matches{
            API.shared.getImage(matches.recipeImage, completion: { (image) -> () in
                self.imageView.image = image
                
            })
            
        }
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.imageView.image = nil
    }

}
