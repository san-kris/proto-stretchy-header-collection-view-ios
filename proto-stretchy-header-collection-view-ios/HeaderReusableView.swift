//
//  HeaderReusableView.swift
//  proto-stretchy-header-collection-view-ios
//
//  Created by Santosh Krishnamurthy on 3/20/23.
//

import UIKit

class HeaderReusableView: UICollectionReusableView {
    
    // create a image view object for header
    let imageView: UIImageView =  {
       let imv = UIImageView(image: UIImage(named: "header"))
        imv.contentMode = .scaleAspectFill
        return imv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // custom layout code here
        self.backgroundColor = .red
        // add the image view as subview
        self.addSubview(imageView)
        
        // set the anchors
        anchorToSuperview(view: imageView)
                
    }
    
    // setup anchors for image in header
    func anchorToSuperview(view: UIView) -> Void {
        // disable auto constraints
        view.translatesAutoresizingMaskIntoConstraints = false

        // set the anchor to superview anchor
        if let superviewTopAnchor = view.superview?.topAnchor {
            view.topAnchor.constraint(equalTo: superviewTopAnchor, constant: 0).isActive = true
        }
        
        // set the anchor to superview anchor
        if let superviewBottomAnchor = view.superview?.bottomAnchor {
            view.bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: 0).isActive = true
        }
        
        // set the anchor to superview anchor
        if let superviewLeadingAnchor = view.superview?.leadingAnchor {
            view.leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: 0).isActive = true
        }
        
        // set the anchor to superview anchor
        if let superviewTrailingAnchor = view.superview?.trailingAnchor {
            view.trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: 0).isActive = true
        }

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
