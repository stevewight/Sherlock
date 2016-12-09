//
//  RadialGradient.swift
//  Sherlock
//
//  Created by Steve on 12/5/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialGradient: MaskFilter {
    
    var feature:CIFeature!
    
    // Get radial from face feature
    init(_ inputFeature:CIFeature) {
        super.init()
        feature = inputFeature
        setFilter()
    }
    
    private func setFilter() {
        let radius = getRadius()
        let vector = getVector()
        let colors = getColors()
        
        filter = CIFilter(name: "CIRadialGradient")!
        filter.setValue(radius, forKey: "inputRadius0")
        filter.setValue(radius + 0.75, forKey: "inputRadius1")
        filter.setValue(colors.first!, forKey: "inputColor0")
        filter.setValue(colors.last!, forKey: "inputColor1")
        filter.setValue(vector, forKey: "inputCenter")
    }
    
    private func getVector()->CIVector {
        let x = feature.bounds.midX
        let y = feature.bounds.midY
        return CIVector(x: x, y: y)
    }
    
    private func getRadius()->Float {
        let rad = min(
            feature.bounds.width,
            feature.bounds.height
            ) / 1.5
        return Float(rad)
    }
    
}
