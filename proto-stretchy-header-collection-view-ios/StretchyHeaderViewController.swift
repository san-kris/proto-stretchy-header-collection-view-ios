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

class StretchyHeaderViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow

    }

}
