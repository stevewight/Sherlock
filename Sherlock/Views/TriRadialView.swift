//
//  TriRadialView.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TriRadialView: BaseFrameView {
    
    var outerRing:CAShapeLayer!
    var middleRing:CAShapeLayer!
    var innerRing:CAShapeLayer!
    
    override internal func setUp() {
        setUpCircles()
    }
    
    private func complexSpin(_ circle:CAShapeLayer) {
        let animation = SpinnerAnimate(circle)
        animation.complex()
    }
    
    private func spin(_ circle:CAShapeLayer) {
        let animation = SpinnerAnimate(circle)
        animation.rotateClockwise()
    }
    
    private func pulse(_ circle:CAShapeLayer) {
        let animation = SpinnerAnimate(circle)
        animation.pulse()
    }
    
    private func setUpCircles() {
        setUpOuterRing()
        setUpMiddleRing()
        //setUpInnerRing()
    }
    
    private func setUpOuterRing() {
        outerRing = createCircle()
        outerRing.lineDashPattern = [1.0]
        let path = outerRingPath(outerRing)
        outerRing.path = path.cgPath
        layer.addSublayer(outerRing)
        spin(outerRing)
    }
    
    private func setUpMiddleRing() {
        middleRing = createCircle()
        let path = middleRingPath(middleRing)
        middleRing.path = path.cgPath
        layer.addSublayer(middleRing)
        complexSpin(middleRing)
    }
    
    private func setUpInnerRing() {
        innerRing = createCircle()
        //innerRing.lineDashPattern = [4.0]
        let path = innerRingPath(innerRing)
        innerRing.path = path.cgPath
        layer.addSublayer(innerRing)
        pulse(innerRing)
    }
    
    private func createCircle()->CAShapeLayer {
        let circle = CAShapeLayer()
        circle.frame = layer.bounds
        circle.fillColor = nil
        circle.strokeColor = lineColor
        circle.lineWidth = CGFloat(lineWidth)
    
        return circle
    }
    
    private func innerRingPath(_ circle:CAShapeLayer)->UIBezierPath {
        let startAngel = CGFloat(-M_PI_2)
        let endAngel = startAngel + CGFloat(M_PI * 2)
        var radius = circle.bounds.size.width/2.0
        radius -= (CGFloat(lineWidth) * 2) + 4.0
        
        return UIBezierPath(
            arcCenter: circle.position,
            radius: radius,
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: true
        )
    }
    
    private func middleRingPath(_ circle:CAShapeLayer)->UIBezierPath {
        let startAngel = CGFloat(-M_PI_2)
        let endAngel = startAngel + CGFloat(M_PI * 2)
        var radius = circle.bounds.size.width/2.0
        radius -= CGFloat(lineWidth) + 2.0
        
        return UIBezierPath(
            arcCenter: circle.position,
            radius: radius,
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: true
        )
    }
    
    private func outerRingPath(_ circle:CAShapeLayer)->UIBezierPath {
        let startAngel = CGFloat(-M_PI_2)
        let endAngel = startAngel + CGFloat(M_PI * 2)
        
        return UIBezierPath(
            arcCenter: circle.position,
            radius: (circle.bounds.size.width/2.0),
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: true
        )
    }

}
