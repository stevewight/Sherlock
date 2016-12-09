//
//  BoxView.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class BoxView: BaseFrameView {

    override internal func setUp() {
        layer.borderWidth = CGFloat(lineWidth)
        layer.borderColor = lineColor
        backgroundColor = UIColor.clear
    }

}
