//
//  FaceDetector.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceDetector: NSObject {

    private var detector:CIDetector!
    public var faces:[CIFeature]!
    
    init(_ image:CIImage) {
        super.init()
        prepareDetector()
        detectFaceFeatures(image)
    }
    
    private func prepareDetector() {
        detector = DetectorFactory.face()
    }
    
    private func detectFaceFeatures(_ image:CIImage) {
        faces = detector.features(in: image)
    }
    
}
