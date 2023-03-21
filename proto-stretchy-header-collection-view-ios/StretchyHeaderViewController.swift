//
//  StretchyHeaderViewController.swift
//  proto-stretchy-header-collection-view-ios
//
//  Created by Santosh Krishnamurthy on 3/19/23.
//

import UIKit

/**
 Perform following steps when adding view controller programatically
 1. delete the main.stryboard file
 2. navigate to Prject > target > info and delete the "Main stryboard file base name"
 3. navigate to Prject > target > info and delete "stryboard name" under "Applicatioon Scene Manifest"
 4. Go to sceneDeleate.swift and create a new window object using window scene
  - Set rootViewController for window
  - call "makeKeyAndVisible" method on window
 */

class StretchyHeaderViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    fileprivate let cellId = "cellId"
    fileprivate let headerId = "headerId"
    fileprivate let padding: CGFloat = 16

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupCollectionViewLayout()

    }
    
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        
        // if you want the header to display under notch at the top and home bar at the bottom
        collectionView.contentInsetAdjustmentBehavior = .never
        
        // a custom cell has to be registered with the view
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        // a custom collection view header has to be registered with the view
        collectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
    }
    
    fileprivate func setupCollectionViewLayout() {
        // collection view layout customization
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        if contentOffsetY > 0 {
            headerView?.animator.fractionComplete = 0
            return
        }
        headerView?.animator.fractionComplete = abs(contentOffsetY) / 100
        
    }
    
    // specify number of secions in collection view
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    // specify number of items in section
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }
    
    // create and return a cell object for display
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = .black
        return cell
    }
    
    // this is a delegate method for changing the design/size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 2 * padding, height: 50)
    }
    
    // declare an optional property to capture the reference to header
    var headerView: HeaderReusableView?
    
    // we need to deque header and return the value. Header will not display until a size is set
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as? HeaderReusableView
        return headerView!
    }
    
    // return a size for header view
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 340)
    }

}
