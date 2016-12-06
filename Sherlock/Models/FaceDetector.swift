//
//  FaceDetector.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceDetector: NSObject {

    public var faces:[CIFeature]!
    public var detectBlink:Bool = false
    public var detectSmile:Bool = false
    
    private var detector:CIDetector!
    
    init(_ image:CIImage) {
        super.init()
        prepareDetector()
        detectFaces(image)
    }
    
    private func prepareDetector() {
        detector = CIDetector(
            ofType: CIDetectorTypeFace,
            context: nil,
            options: initializeOptions()
        )!
    }
    
    private func initializeOptions()->[String: Any] {
        return [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorAspectRatio: 1.0
        ] as [String : Any]
    }
    
    private func detectFaces(_ image:CIImage) {
        let options:[String:Bool] = [
            CIDetectorSmile: detectSmile,
            CIDetectorEyeBlink: detectBlink
        ]
        faces = detector.features(
            in: image, options: options
        )
    }
    
}
