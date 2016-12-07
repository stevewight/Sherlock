//
//  FaceBoxView.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceBoxView: UIView {
    
    var boxColor:CGColor =  UIColor.red.cgColor

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    init(frame:CGRect, color:CGColor) {
        super.init(frame: frame)
        boxColor = color
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    private func setUp() {
        layer.borderWidth = 3.0
        layer.borderColor = boxColor
        backgroundColor = UIColor.clear
    }

}
