//
//  RectGradient.swift
//  Sherlock
//
//  Created by Steve on 12/8/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RectGradient: MaskFilter {

    var feature:CIFeature!
    
    // Get Rect from feature
    init(_ inputFeature:CIFeature) {
        super.init()
        feature = inputFeature
        setFilter()
    }
    
    override public func output() -> CIImage {
        let outImage = filter.outputImage!
        return outImage.cropping(to: feature.bounds)
    }
    
    private func setFilter() {
        let startVector = getStartVector()
        let endVector = getEndVector()
        let colors = getColors()
        
        filter = CIFilter(name: "CILinearGradient")!
        filter.setValue(startVector, forKey: "inputPoint0")
        filter.setValue(endVector, forKey: "inputPoint1")
        filter.setValue(colors.first!, forKeyPath: "inputColor0")
        filter.setValue(colors.last!, forKeyPath: "inputColor1")
    }
    
    private func getStartVector()->CIVector {
        return CIVector(cgRect: feature.bounds)
    }
    
    private func getEndVector()->CIVector {
        return CIVector(cgRect: feature.bounds)
    }

}
