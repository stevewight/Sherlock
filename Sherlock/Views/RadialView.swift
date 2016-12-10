//
//  RadialView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialView: BaseFrameView {

    var ringLayer: CAShapeLayer!
    
    override internal func setUp() {
       self.layoutSubviews()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setUpRingLayer()
    }
    
    func setUpRingLayer() {
        ringLayer = baseRingLayer()
        
        ringLayer.frame = layer.bounds
        ringLayer.strokeEnd = 75.0
        ringLayer.strokeColor = lineColor
        ringLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ringLayer.transform = CATransform3DRotate(
            ringLayer.transform,
            CGFloat(-M_PI/2.0), 0, 0, 1
        )
        layer.addSublayer(ringLayer)
    }
    
    private func baseRingLayer()->CAShapeLayer {
        let newLayer = CAShapeLayer()
        let path = radialPath()
        
        newLayer.path = path.cgPath
        newLayer.fillColor = nil
        newLayer.lineWidth = CGFloat(lineWidth)
        newLayer.lineDashPattern = [4.0]
        
        return newLayer
    }
    
    private func radialPath()->UIBezierPath {
        let insets = CGFloat(lineWidth/2.0)
        let rect = bounds.insetBy(dx: insets, dy: insets)
        return UIBezierPath(ovalIn: rect)
    }

}
