//
//  SearchCollectionFlowLayout.swift
//  Project1
//
//  Created by Lacey Vu on 3/3/16.
//  Copyright © 2016 Lacey Vu. All rights reserved.
//

import UIKit

class SearchCollectionFlowLayout: UICollectionViewFlowLayout
{
    
    var columns: Int
    var spacing: CGFloat = 2

    
    init(columns: Int = 2) {
        
        self.columns = columns
        super.init()
        self.setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been implemented")
    }
    
    func setup()
    {
        self.minimumLineSpacing = self.spacing
        self.minimumInteritemSpacing = self.spacing
        self.sectionInset = UIEdgeInsets(top: 2, left: 0.5, bottom: 2, right: 0.5)
        self.itemSize = CGSize(width: self.itemWidth(), height: self.itemWidth())
        
    }
    
    func screenWidth() -> CGFloat
    {
        return CGRectGetWidth(UIScreen.mainScreen().bounds)
    }
    
    func itemWidth() -> CGFloat
    {
        let width = self.screenWidth()
        let availableWidth = width - (CGFloat(self.columns) * self.spacing)
        return availableWidth / CGFloat(self.columns)
    }
    
    
}
