//
//  RadialView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialView: BaseFrameView {
    
    override internal func setUp() {
       setUpCircle()
    }
    
    private func setUpCircle() {
        let circle = CAShapeLayer()
        circle.frame = layer.bounds
        circle.fillColor = nil
        circle.strokeColor = lineColor
        circle.lineWidth = CGFloat(lineWidth)
        circle.lineDashPattern = [4.0]
        
        let path = circlePath(circle)
        circle.path = path.cgPath
        layer.addSublayer(circle)
    }
    
    private func circlePath(_ circle:CAShapeLayer)->UIBezierPath {
        return UIBezierPath(
            arcCenter: circle.position,
            radius: (circle.bounds.size.width/2.0),
            startAngle: 0.0,
            endAngle: CGFloat(2.0 * Float.pi),
            clockwise: true
        )
    }

}
