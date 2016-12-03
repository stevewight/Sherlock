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
    
    class func radial(_ feature:CIFeature)-> CIFilter {
        let x = feature.bounds.midX
        let y = feature.bounds.midY
        let radius = min(
            feature.bounds.width,
            feature.bounds.height
        ) / 1.5
        let color0 = UIColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        let color1 = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        let vector = CIVector(x: x, y: y)
        
        let filter = CIFilter(name: "CIRadialGradient")!
        filter.setValue(radius, forKey: "inputRadius0")
        filter.setValue(radius + 0.75, forKey: "inputRadius1")
        filter.setValue(CIColor(color:color0), forKey: "inputColor0")
        filter.setValue(CIColor(color:color1), forKey: "inputColor1")
        filter.setValue(vector, forKey: "inputCenter")
        return filter
    }
    
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
    
}
