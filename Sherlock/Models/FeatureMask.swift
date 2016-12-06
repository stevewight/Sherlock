//
//  FeatureMask.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FeatureMask: NSObject {

    var features:[CIFeature]!
    
    init(_ features:[CIFeature]) {
        super.init()
        self.features = features
    }
    
    public func output(_ filter:CIFilter,_ image:CIImage)->CIImage {
        let featuresMask = featuresToImage(image)
        return filterMask(
            featuresMask,
            image: image,
            filter: filter
        )
    }
    
    private func featuresToImage(_ image:CIImage)->CIImage {
        var finalMask = CIImage()
        for feature in features {
            let radial = radialImage(feature)
            finalMask = overCompImage(radial, finalMask)
        }
        return finalMask
    }
    
    private func radialImage(_ face:CIFeature)->CIImage {
        let radialFIlter = RadialGradient(face)
        return radialFIlter.output()
    }
    
    private func overCompImage(_ shape:CIImage,_ background:CIImage)->CIImage {
        let overCompFilter = OverComp(shape, background)
        return overCompFilter.output()
    }
    
    private func filterMask(_ mask:CIImage,image:CIImage,filter:CIFilter)->CIImage {
        let blendFilter = BlendMask(filter.outputImage!,image,mask)
        return blendFilter.output()
    }
    
}
