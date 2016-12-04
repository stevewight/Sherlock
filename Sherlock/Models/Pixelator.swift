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
        //filter = FilterFactory.crystalize(coreImage, 33.0)
    }
    
    public func pixelate(features:[CIFeature])->UIImage {
        let final = featureMask(features)
        let cgImage = context.createCGImage(
            final,
            from: final.extent
        )
        return UIImage(cgImage: cgImage!)
    }
    
    private func featureMask(_ features:[CIFeature])->CIImage {
        let masker = FeatureMask(features)
        return masker.output(filter, coreImage)
    }
    
}
