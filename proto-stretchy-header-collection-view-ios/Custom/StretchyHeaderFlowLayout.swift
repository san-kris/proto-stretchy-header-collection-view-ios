//
//  StretchyHeaderFlowLayout.swift
//  proto-stretchy-header-collection-view-ios
//
//  Created by Santosh Krishnamurthy on 3/20/23.
//

import UIKit

// define a custom flow layout class for collection view
class StretchyHeaderFlowLayout: UICollectionViewFlowLayout {
    // need to provide layout attributes for each element
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        // get the list of all elements in collection and its attributes, including header, cell and footer
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        
        // looop through each item in the list and find the header element
        layoutAttributes?.forEach({ (attributes) in
            // if the header element is found and its the first header only. Wont work for multiple header
            if attributes.representedElementKind == UICollectionView.elementKindSectionHeader && attributes.indexPath.section == 0{
                // get the reference to parent collection view
                guard let collectionView = collectionView else { return }
                
                // get the offset of the entire collection view
                let contentOffsetY = collectionView.contentOffset.y
                // print(contentOffsetY)
                
                // Offset will be +ve if scrolling up.
                if contentOffsetY > 0 { return }
                
                // calculate the height of the header when pull down
                // this will make the header area bigger
                let height = attributes.frame.height - contentOffsetY
                // set the width and height
                let width = collectionView.frame.width
                
                // set the frame of the header element. Y value is countering the change in heiht
                attributes.frame = CGRect(x: 0, y: contentOffsetY, width: width, height: height)
            }
        })
        
        return layoutAttributes
    }
    
    // this function will force the flow layout to recalculate everytime we scroll
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
