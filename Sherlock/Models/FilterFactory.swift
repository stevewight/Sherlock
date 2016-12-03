//
//  FilterFactory.swift
//  Sherlock
//
//  Created by Steve on 12/3/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FilterFactory: NSObject {

    class func pixellate(_ image:CIImage,_ scale:Double)-> CIFilter {
        let filter = CIFilter(name: "CIPixellate")!
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(scale, forKey: kCIInputScaleKey)
        return filter
    }
    
    class func crystalize(_ image:CIImage,_ radius:Double)-> CIFilter {
        let filter = CIFilter(name: "CICrystallize")!
        filter.setValue(image, forKey: kCIInputImageKey)
        filter.setValue(radius, forKey: kCIInputRadiusKey)
        return filter
    }
    
    // Get radial from face feature
    class func radial(_ feature:CIFeature)-> CIFilter {
        let radius = getRadius(feature)
        let vector = getVector(feature)
        let colors = getColors()
        
        let filter = CIFilter(name: "CIRadialGradient")!
        filter.setValue(radius, forKey: "inputRadius0")
        filter.setValue(radius + 0.75, forKey: "inputRadius1")
        filter.setValue(colors.first!, forKey: "inputColor0")
        filter.setValue(colors.last!, forKey: "inputColor1")
        filter.setValue(vector, forKey: "inputCenter")
        return filter
    }
    
    // For composing the face(radial) to mask
    class func overComp(_ image:CIImage,_ background:CIImage)->CIFilter {
        let filter = CIFilter(name: "CISourceOverCompositing")!
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(background, forKey: "inputBackgroundImage")
        return filter
    }
    
    // Compose all three images together to make final product
    class func blendMask(image:CIImage,background:CIImage,mask:CIImage)->CIFilter {
        let filter = CIFilter(name: "CIBlendWithMask")!
        filter.setValue(image, forKey: "inputImage")
        filter.setValue(background, forKey: "inputBackgroundImage")
        filter.setValue(mask, forKey: "inputMaskImage")
        return filter
    }
    
    private class func getVector(_ feature:CIFeature)->CIVector {
        let x = feature.bounds.midX
        let y = feature.bounds.midY
        return CIVector(x: x, y: y)
    }
    
    private class func getRadius(_ feature:CIFeature)->Float {
        let rad = min(
            feature.bounds.width,
            feature.bounds.height
        ) / 1.5
        return Float(rad)
    }
    
    private class func getColors()->[CIColor] {
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
