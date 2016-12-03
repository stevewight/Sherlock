//
//  PixelFace.swift
//  Sherlock
//
//  Created by Steve on 12/3/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class PixelFace: NSObject {
    
    var filter:CIFilter!
    var coreImage:CIImage!
    var faceFeatures:[CIFeature]!
    
    init(_ image:CIImage,_ faces:[CIFeature]) {
        filter = FilterFactory.pixellate(image, 33.0)
        coreImage = image
        faceFeatures = faces
    }
    
    public func pixellate()->UIImage {
        var mask:CIImage = CIImage()
        for face in faceFeatures {
            let radial = radialImage(face)
            mask = overCompImage(radial, mask)
        }
        let final = maskImage(mask)
        return UIImage(ciImage: final)
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
