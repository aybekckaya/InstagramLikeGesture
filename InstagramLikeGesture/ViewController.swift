//
//  ViewController.swift
//  InstagramLikeGesture
//
//  Created by aybek can kaya on 31.05.2019.
//  Copyright © 2019 aybek can kaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewGesture: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }

    override var prefersStatusBarHidden: Bool {
        return true 
    }
    
    private func setUpUI() {
        
        let likeGesture = LikeGestureRecognizer(target: self, action: #selector(handleLikeGesture(gesture:)))
        self.viewGesture.addGestureRecognizer(likeGesture)
    }
    
    @objc private func handleLikeGesture(gesture:LikeGestureRecognizer) {
        guard gesture.state == .ended , gesture.status == .success else { return }
        animateLike()
    }
    
   
    private func animateLike() {
        let viewHeart = HeartView(frame: CGRect(x: 0, y: 0, width: 90, height: 90))
        viewHeart.center = viewGesture.center
        self.view.addSubview(viewHeart)
        
        viewHeart.animate { heartView in
            heartView.removeFromSuperview()
        }
        
    }
    
}


extension UIView {
    
    func addAllignmentConstraints(baseView:UIView , centerX:CGFloat? , centerY:CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let centerX = centerX {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.centerX, multiplier: 1, constant: centerX).isActive = true
        }
        if let centerY = centerY {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: centerY).isActive = true
        }
        
    }
    
    
    func addLengthConstraints(height:CGFloat? , width:CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let height = height {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: height).isActive = true
        }
        if let width = width {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: width).isActive = true
        }
    }
    
    func addSnapConstraints(baseView:UIView , top:CGFloat? , bottom:CGFloat? , leading:CGFloat? , trailing:CGFloat?) {
        self.translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: top).isActive = true
        }
        if let bottom = bottom {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: bottom).isActive = true
        }
        if let leading = leading {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: leading).isActive = true
        }
        if let trailing = trailing {
            NSLayoutConstraint(item: self, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: baseView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: trailing).isActive = true
        }
    }
    
    
}


