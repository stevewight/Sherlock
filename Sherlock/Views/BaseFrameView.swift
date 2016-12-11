//
//  BaseFrameView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BaseFrameView: UIView {

    var lineColor:CGColor =  UIColor.red.cgColor
    var lineWidth:Double = 1.5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    init(frame:CGRect, color:CGColor, width:Double) {
        super.init(frame: frame)
        lineColor = color
        lineWidth = width
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    internal func setUp() {
        preconditionFailure("Must be overridden")
    }
    
    public func animateBreath() {
        UIView.animate(
            withDuration: 0.66,
            delay: 0.0,
            options: [.autoreverse, .curveEaseInOut, .repeat],
            animations: {
                let rotate = CGAffineTransform(
                    rotationAngle: CGFloat(Float.pi)
                )
                self.transform = rotate.scaledBy(x: 1.5, y: 1.5)
        }, completion: { (success) in
            
        })
    }

}
