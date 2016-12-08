//
//  FaceFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceFramer: FeatureFramer {

    override init(_ imageView:UIImageView) {
        super.init(imageView)
        detector = FaceDetector(coreImage)
    }
    
}
