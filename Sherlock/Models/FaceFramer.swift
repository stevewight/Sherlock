//
//  FaceFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceFramer: FeatureFramer {
    
    var faceDetector:FaceDetector!

    override init(_ imageView:UIImageView) {
        super.init(imageView)
        faceDetector = FaceDetector(coreImage)
    }
    
    public func box() {
        buildBoxes(features: faceDetector.faces)
    }
    
}
