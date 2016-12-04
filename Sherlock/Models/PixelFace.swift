//
//  PixelFace.swift
//  Sherlock
//
//  Created by Steve on 12/3/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class PixelFace: NSObject {
    
    var coreImage:CIImage!
    var detector:CIDetector!
    var filter:CIFilter!
    var faceFeatures:[CIFeature]!
    let context = CIContext()
    
    init(_ image:UIImage) {
        super.init()
        coreImage = CIImage(image: image)
        prepareDetector()
        filter = FilterFactory.pixellate(coreImage, 33.0)
        faceFeatures = detector.features(in: coreImage)
    }
    
    public func pixellate()->UIImage {
        let final = maskImage(faceMask())
        let cgImage = context.createCGImage(
            final,
            from: final.extent
        )
        return UIImage(cgImage: cgImage!)
    }
    
    private func faceMask()->CIImage {
        var mask:CIImage = CIImage()
        for face in faceFeatures {
            let radial = radialImage(face)
            mask = overCompImage(radial, mask)
        }
        return mask
    }
    
    private func prepareDetector() {
        detector = DetectorFactory.face()
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
