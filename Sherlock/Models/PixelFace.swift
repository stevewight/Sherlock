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
    var faceDetector:FaceDetector!
    var pixelator:Pixelator!
    
    init(_ image:UIImage) {
        super.init()
        coreImage = CIImage(image: image)
        faceDetector = FaceDetector(coreImage)
        pixelator = Pixelator(coreImage)
    }
    
    public func pixelate()->UIImage {
        let faces = faceDetector.faces
        return pixelator.pixelate(features: faces!)
    }
    
}
