//
//  Pixelator.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class Pixelator: NSObject {
    
    let context = CIContext()
    var coreImage:CIImage!
    var filter:CIFilter!
    
    init(_ image:CIImage) {
        super.init()
        coreImage = image
        filter = FilterFactory.pixellate(coreImage, 33.0)
    }
    
    public func pixelate(features:[CIFeature])->UIImage {
        let final = maskImage(featureMask(features))
        let cgImage = context.createCGImage(
            final,
            from: final.extent
        )
        return UIImage(cgImage: cgImage!)
    }
    
    private func featureMask(_ features:[CIFeature])->CIImage {
        var mask:CIImage = CIImage()
        for face in features {
            let radial = radialImage(face)
            mask = overCompImage(radial, mask)
        }
        return mask
    }

    private func radialImage(_ face:CIFeature)->CIImage {
        let radialFilter = FilterFactory.radial(face)
        return radialFilter.outputImage!
    }
    
    private func overCompImage(_ circle:CIImage,_ background:CIImage)->CIImage {
        let overCompFilter = FilterFactory.overComp(circle, background)
        return overCompFilter.outputImage!
    }
    
    private func maskImage(_ mask:CIImage)->CIImage {
        let pixellated = filter.outputImage!
        let blendFilter = FilterFactory.blendMask(
            image: pixellated,
            background: coreImage,
            mask: mask
        )
        return blendFilter.outputImage!
    }
    
}
