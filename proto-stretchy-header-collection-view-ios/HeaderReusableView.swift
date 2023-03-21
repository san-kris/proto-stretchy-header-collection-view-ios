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
    
    var animator: UIViewPropertyAnimator!
    let visualEffectView = UIVisualEffectView(effect: nil)
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // custom layout code here
        self.backgroundColor = .clear
        // add the image view as subview
        addSubview(imageView)
        imageView.fillSuperview()
        // Add an VisualEffect as subview over the image view
        addSubview(visualEffectView)
        // set the anchors
        visualEffectView.fillSuperview()
        
        // setup Blur Effect
        setupVisualEffectBlur()
        
        let gradiantLayer = CAGradientLayer()
        gradiantLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradiantLayer.locations = [0, 1]
        // layer.addSublayer(gradiantLayer)
        // this is a static frame
        // gradiantLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        
        let headerLabel = UILabel()
        headerLabel.text = "Header text"
        headerLabel.textColor = .white
        headerLabel.font = UIFont.systemFont(ofSize: 24, weight: UIFont.Weight.heavy)
        headerLabel.numberOfLines = 0
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = "Long description text text text text text text text text text text text text text text text"
        descriptionLabel.textColor = .white
        descriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
        descriptionLabel.numberOfLines = 0
        
        let gradiantContainerView = UIView()
        addSubview(gradiantContainerView)
        gradiantContainerView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        gradiantContainerView.layer.addSublayer(gradiantLayer)
        gradiantLayer.frame = self.bounds
        gradiantLayer.frame.origin.y -= bounds.height
        
        let stackView = UIStackView(arrangedSubviews: [headerLabel, descriptionLabel])
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
                
    }
    
    fileprivate func setupVisualEffectBlur() -> Void {
        
        animator = UIViewPropertyAnimator(duration: 1.0, curve: .linear)
                
        animator.addAnimations { [weak self] in
            // treat this area as the end state of the animation
            let blurEffect = UIBlurEffect(style: .regular)
            self?.visualEffectView.effect = blurEffect
            // visualEffectView.alpha = 1.0
                
        }
        // call function to start animation
        // animator.startAnimation()
        // animator.fractionComplete = 0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
