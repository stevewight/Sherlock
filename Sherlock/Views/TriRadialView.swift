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
        outerRing.path = createPath(outerRing, 0)
        layer.addSublayer(outerRing)
        spin(outerRing)
    }
    
    private func setUpMiddleRing() {
        middleRing = createCircle()
        middleRing.path = createPath(middleRing, 1)
        layer.addSublayer(middleRing)
        complexSpin(middleRing)
    }
    
    private func setUpInnerRing() {
        innerRing = createCircle()
        //innerRing.lineDashPattern = [4.0]
        innerRing.path = createPath(innerRing, 2)
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
    
    private func createPath(_ circle:CAShapeLayer,_ index:Int)->CGPath {
        let startAngel = CGFloat(-M_PI_2)
        let endAngel = startAngel + CGFloat(M_PI * 2)
        let circleWidth = circle.bounds.size.width
        
        return UIBezierPath(
            arcCenter: circle.position,
            radius: radius(index, width: circleWidth),
            startAngle: startAngel,
            endAngle: endAngel,
            clockwise: true
        ).cgPath
    }
    
    private func radius(_ index:Int, width:CGFloat)->CGFloat {
        var baseRad = Int(width)/2
        let reduction = (Int(lineWidth) * index) + (2 * index)
        baseRad -= reduction
        return CGFloat(baseRad)
    }

}
