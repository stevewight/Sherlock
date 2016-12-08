//
//  TextDetector.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TextDetector: BaseDetector {
    
    public var textBlocks:[CIFeature]!
    
    init(_ image:CIImage) {
        super.init(image, type: CIDetectorTypeText)
    }
    
    override public func features()->[CIFeature] {
        return textBlocks
    }
    
    override internal func detect(_ image:CIImage) {
        textBlocks = detector.features(in: image)
    }
    
}
