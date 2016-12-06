//
//  FaceObscure.swift
//  Sherlock
//
//  Created by Steve on 12/3/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FaceObscure: NSObject {
    
    var coreImage:CIImage!
    var faceDetector:FaceDetector!
    var obscureFilter:ObscureFilter!
    
    init(_ image:UIImage) {
        super.init()
        coreImage = CIImage(image: image)
        faceDetector = FaceDetector(coreImage)
    }
    
    public func pixelate()->UIImage {
        obscureFilter = Pixelator(coreImage)
        return output()
    }
    
    public func crystalize()->UIImage {
        obscureFilter = Crystalizer(coreImage)
        return output()
    }
    
    private func output()->UIImage {
        return obscureFilter.output(
            features: faceDetector.faces!
        )
    }
    
}
