//
//  BaseFrameView.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BaseFrameView: UIView {

    public func animateBreath() {
        UIView.animate(
            withDuration: 0.33,
            delay: 0.0,
            options: [.autoreverse, .curveEaseInOut, .repeat],
            animations: {
                self.transform = CGAffineTransform(
                    scaleX: 1.5,
                    y: 1.5
                )
        }, completion: nil
        )
    }

}
