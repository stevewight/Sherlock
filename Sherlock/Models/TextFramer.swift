//
//  TextFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class TextFramer: FeatureFramer {

    var textDetector:TextDetector!
    
    override init(_ imageView:UIImageView) {
        super.init(imageView)
        textDetector = TextDetector(coreImage)
    }
    
    public func box() {
        buildBoxes(features: textDetector.textBlocks)
    }
    
}
