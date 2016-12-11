//
//  SpinnerAnimation.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class SpinnerAnimate: NSObject {
    
    var circle:CAShapeLayer!
    
    init(_ inputCircle:CAShapeLayer) {
        super.init()
        circle = inputCircle
    }
    
    public func start() {
        circle.add(endAnimation(), forKey: "strokeEnd")
        circle.add(startAnimation(), forKey: "strokeStart")
        circle.add(rotateAnimation(), forKey: "rotate")
    }
    
    private func endAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }
    
    private func startAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }
    
    private func rotateAnimation()->CAAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = M_PI * 2
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        return animation
    }
    
}
