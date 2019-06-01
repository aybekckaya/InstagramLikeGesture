//
//  LikeGestureRecognizer.swift
//  InstagramLikeGesture
//
//  Created by aybek can kaya on 1.06.2019.
//  Copyright © 2019 aybek can kaya. All rights reserved.
//

import Foundation
import UIKit

enum LikeGestureStatus {
    case unknown
    case fail
    case success
}

class LikeGestureRecognizer:UIGestureRecognizer {
    private var lastTouchTime:CFTimeInterval = CACurrentMediaTime()
    private(set) var status = LikeGestureStatus.unknown
    private(set) var doubleTapGestureThreshold:CFTimeInterval = 0.25
    
   /// Customize double-tap gesture recognizer timing
    // if time between continious taps is smaller than threshold value , then gesture succeed
    func setThreshold(threshold:CFTimeInterval) {
        self.doubleTapGestureThreshold = threshold
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        self.state = .began
        self.status = .unknown
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        self.state = .changed
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        let currentTime = CACurrentMediaTime()
        let diff:CFTimeInterval = currentTime - lastTouchTime
        
        self.status = diff < doubleTapGestureThreshold ? LikeGestureStatus.success : LikeGestureStatus.fail
        self.state = .ended
        
        lastTouchTime = currentTime
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
    }
}
