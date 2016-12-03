//
//  DetectorFactory.swift
//  Sherlock
//
//  Created by Steve on 12/2/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class DetectorFactory: NSObject {

    class func face()-> CIDetector {
        let options = [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorAspectRatio: 1.0
        ] as [String : Any]
        return CIDetector(
            ofType: CIDetectorTypeFace,
            context: nil,
            options: options
        )!
    }
    
}
