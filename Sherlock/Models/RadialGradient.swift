//
//  RadialGradient.swift
//  Sherlock
//
//  Created by Steve on 12/5/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class RadialGradient: MaskFilter {
    
    // Get radial from face feature
    init(_ feature:CIFeature) {
        super.init()
        setFilter(feature: feature)
    }
    
    private func setFilter(feature:CIFeature) {
        let radius = getRadius(feature)
        let vector = getVector(feature)
        let colors = getColors()
        
        filter = CIFilter(name: "CIRadialGradient")!
        filter.setValue(radius, forKey: "inputRadius0")
        filter.setValue(radius + 0.75, forKey: "inputRadius1")
        filter.setValue(colors.first!, forKey: "inputColor0")
        filter.setValue(colors.last!, forKey: "inputColor1")
        filter.setValue(vector, forKey: "inputCenter")
    }
    
    private func getVector(_ feature:CIFeature)->CIVector {
        let x = feature.bounds.midX
        let y = feature.bounds.midY
        return CIVector(x: x, y: y)
    }
    
    private func getRadius(_ feature:CIFeature)->Float {
        let rad = min(
            feature.bounds.width,
            feature.bounds.height
            ) / 1.5
        return Float(rad)
    }
    
    private func getColors()->[CIColor] {
        let color0 = UIColor(
            red: 0.0, green: 1.0,
            blue: 0.0, alpha: 1.0
        )
        let color1 = UIColor(
            red: 0.0, green: 0.0,
            blue: 0.0, alpha: 0.0
        )
        return [
            CIColor(color: color0),
            CIColor(color: color1)
        ]
    }
    
}
