//
//  TriRadialView.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TriRadialView: BaseFrameView {
    
    var rings = [CAShapeLayer]()
    
    override internal func setUp() {
        setUpRings()
    }
    
    private func complexSpin(_ circle:CAShapeLayer) {
        let animation = SpinAnimate(circle)
        animation.complex()
    }
    
    private func spin(_ circle:CAShapeLayer) {
        let animation = SpinAnimate(circle)
        animation.rotate()
    }
    
    private func pulse(_ circle:CAShapeLayer) {
        let animation = SpinAnimate(circle)
        animation.pulse()
    }
    
    private func setUpRings() {
        setUpRing(0)
        setUpRing(1)
        setUpRing(2)
    }
    
    private func setUpRing(_ index:Int) {
        let ring = createCircle()
        
        dashLine(ring, index)
        ring.path = createPath(ring, index)
        layer.addSublayer(ring)
        animate(ring,index)
        rings.insert(ring, at: index)
    }
    
    private func dashLine(_ ring:CAShapeLayer,_ index:Int) {
        if index == 1 {
            ring.lineDashPattern = [1.0]
        }
    }
    
    private func animate(_ circle:CAShapeLayer,_ index:Int) {
        switch index {
        case 1:
            spin(circle)
        case 2:
            complexSpin(circle)
        default:
            break
        }
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
