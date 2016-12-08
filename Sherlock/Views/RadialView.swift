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
    
    @IBInspectable open var rating: CGFloat = 100.0 {
        didSet { updateLayerProperties() }
    }
    @IBInspectable var lineWidth: Double = 1.0 {
        didSet { updateLayerProperties() }
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
            ringLayer.strokeColor = UIColor.white.cgColor
        }
    }
    
    func setUpBackgroundRingLayer() {
        backgroundRingLayer = CAShapeLayer()
        layer.addSublayer(backgroundRingLayer)
        
        let insets = CGFloat(lineWidth/2.0)
        let rect = bounds.insetBy(dx: insets, dy: insets)
        let path = UIBezierPath(ovalIn: rect)
        
        backgroundRingLayer.path = path.cgPath
        backgroundRingLayer.fillColor = nil
        backgroundRingLayer.lineWidth = CGFloat(lineWidth)
        backgroundRingLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).cgColor
    }
    
    func setUpRingLayer() {
        ringLayer = CAShapeLayer()
        
        let innerInsets = CGFloat(lineWidth/2.0)
        let innerRect = bounds.insetBy(dx: innerInsets, dy: innerInsets)
        let innerPath = UIBezierPath(ovalIn: innerRect)
        
        ringLayer.path = innerPath.cgPath
        ringLayer.fillColor = nil
        ringLayer.lineWidth = CGFloat(lineWidth)
        ringLayer.strokeColor = UIColor.white.cgColor
        ringLayer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        ringLayer.transform = CATransform3DRotate(
            ringLayer.transform,
            CGFloat(-M_PI/2.0), 0, 0, 1
        )
        layer.addSublayer(ringLayer)
    }

}
