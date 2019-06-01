//
//  HeartView.swift
//  InstagramLikeGesture
//
//  Created by aybek can kaya on 1.06.2019.
//  Copyright © 2019 aybek can kaya. All rights reserved.
//

import UIKit

class HeartView: UIView , CAAnimationDelegate{

    private let imViewLike:UIImageView = {
        let imView = UIImageView()
        imView.translatesAutoresizingMaskIntoConstraints = false
        imView.clipsToBounds = true
        imView.contentMode = UIView.ContentMode.scaleAspectFit
        imView.image = UIImage(named: "heartWhite")!
        return imView
    }()
    
    private var animationClosure:((HeartView)->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    private func setUp() {
        self.addSubview(imViewLike)
        imViewLike.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        self.backgroundColor = UIColor.clear
        imViewLike.layer.opacity = 0
    }
    
    func animate(completion:@escaping ((HeartView)->())) {
        self.animationClosure = completion
        let scaleAnimationShow = CASpringAnimation(keyPath: "transform.scale")
        scaleAnimationShow.fromValue = 0
        scaleAnimationShow.toValue = 1
        scaleAnimationShow.beginTime = 0
        scaleAnimationShow.duration = 0.5
        scaleAnimationShow.isRemovedOnCompletion = false
        scaleAnimationShow.fillMode = CAMediaTimingFillMode.forwards
        scaleAnimationShow.damping = 0.8
        
        let opacityAnimationShow = CABasicAnimation(keyPath: "opacity")
        opacityAnimationShow.fromValue = 0
        opacityAnimationShow.toValue = 1
        opacityAnimationShow.duration = 0.3
        opacityAnimationShow.beginTime = 0
        opacityAnimationShow.isRemovedOnCompletion = false
        opacityAnimationShow.fillMode = CAMediaTimingFillMode.forwards
        
        let scaleAnimationHide = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimationHide.fromValue = 1
        scaleAnimationHide.toValue = 0
        scaleAnimationHide.beginTime = 2
        scaleAnimationHide.duration = 0.5
        scaleAnimationHide.isRemovedOnCompletion = false
        scaleAnimationHide.fillMode = CAMediaTimingFillMode.forwards
        
        let opacityAnimationHide = CABasicAnimation(keyPath: "opacity")
        opacityAnimationHide.fromValue = 1
        opacityAnimationHide.toValue = 0
        opacityAnimationHide.duration = 0.3
        opacityAnimationHide.beginTime = 2
        opacityAnimationHide.isRemovedOnCompletion = false
        opacityAnimationHide.fillMode = CAMediaTimingFillMode.forwards
        
        let group = CAAnimationGroup()
        group.duration = 2.3
        group.fillMode =  CAMediaTimingFillMode.forwards
        group.isRemovedOnCompletion = false
        group.animations = [opacityAnimationShow , scaleAnimationShow , opacityAnimationHide , scaleAnimationHide]
        group.delegate = self
        
        self.imViewLike.layer.add(group, forKey: nil)
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard let closure = animationClosure else { return }
        closure(self)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
