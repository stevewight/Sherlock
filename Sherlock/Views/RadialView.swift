//
//  RadialView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialView: BaseFrameView {

    var backgroundRingLayer: CAShapeLayer!
    var ringLayer: CAShapeLayer!
    
    public var rating: CGFloat = 100.0 {
        didSet { updateLayerProperties() }
    }
    
    override internal func setUp() {
       self.layoutSubviews()
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if (backgroundRingLayer == nil) {
            setUpBackgroundRingLayer()
        }
        backgroundRingLayer.frame = layer.bounds
        
        if (ringLayer == nil) {
            setUpRingLayer()
        }
        ringLayer.frame = layer.bounds
        
        updateLayerProperties()
    }
    
    func updateLayerProperties() {
        if (ringLayer != nil) {
            ringLayer.strokeEnd = rating
            ringLayer.strokeColor = lineColor
        }
    }
    
    func setUpBackgroundRingLayer() {
        backgroundRingLayer = baseRingLayer()
        backgroundRingLayer.strokeColor = UIColor(
            white: 0.5,
            alpha: 0.3
        ).cgColor
        layer.addSublayer(backgroundRingLayer)
    }
    
    func setUpRingLayer() {
        ringLayer = baseRingLayer()
        
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
        
        return newLayer
    }
    
    private func radialPath()->UIBezierPath {
        let insets = CGFloat(lineWidth/2.0)
        let rect = bounds.insetBy(dx: insets, dy: insets)
        return UIBezierPath(ovalIn: rect)
    }

}
