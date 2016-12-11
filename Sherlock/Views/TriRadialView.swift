//
//  TriRadialView.swift
//  Sherlock
//
//  Created by Steve on 12/10/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TriRadialView: BaseFrameView {
    
    override internal func setUp() {
        setUpCircles()
    }
    
    private func spin(_ circle:CAShapeLayer) {
        let animation = SpinnerAnimate(circle)
        animation.start()
    }
    
    private func setUpCircles() {
        let circle = createCircle()
        let path = circlePath(circle)
        circle.path = path.cgPath
        layer.addSublayer(circle)
        spin(circle)
    }
    
    private func createCircle()->CAShapeLayer {
        let circle = CAShapeLayer()
        circle.frame = layer.bounds
        circle.fillColor = nil
        circle.strokeColor = lineColor
        circle.lineWidth = CGFloat(lineWidth)
    
        return circle
    }
    
    private func circlePath(_ circle:CAShapeLayer)->UIBezierPath {
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
