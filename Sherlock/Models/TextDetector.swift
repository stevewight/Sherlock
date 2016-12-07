//
//  TextDetector.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TextDetector: NSObject {
    
    public var textBlocks:[CIFeature]!
    private var detector:CIDetector!
    
    init(_ image:CIImage) {
        super.init()
        prepareDetector()
        detectText(image)
    }
    
    private func prepareDetector() {
        detector = CIDetector(
            ofType: CIDetectorTypeText,
            context: nil,
            options: initializeOptions()
            )!
    }
    
    private func initializeOptions()->[String: Any] {
        return [
            CIDetectorAccuracy: CIDetectorAccuracyHigh,
            CIDetectorReturnSubFeatures: true
            ] as [String: Any]
    }
    
    private func detectText(_ image:CIImage) {
        textBlocks = detector.features(in: image)
    }
    
}
