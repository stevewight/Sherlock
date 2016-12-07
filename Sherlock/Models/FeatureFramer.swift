//
//  FeatureFramer.swift
//  Sherlock
//
//  Created by Steve on 12/6/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class FeatureFramer: NSObject {

    var inputImageView:UIImageView!
    var coreImage:CIImage!
    var shapeColor:UIColor = UIColor.red
    var borderWidth:Double = 3.0
    
    init(_ imageView:UIImageView) {
        super.init()
        inputImageView = imageView
        coreImage = CIImage(image: imageView.image!)
    }
    
    internal func buildBoxes(features:[CIFeature]) {
        let coordTransform = convertCoordSystems()
        
        for feature in features {
            let newBounds = convertPosition(feature, transform: coordTransform)
            let boxView = FaceBoxView(
                frame: newBounds,
                color: shapeColor.cgColor,
                lineWidth: borderWidth
            )
            inputImageView.addSubview(boxView)
        }
    }
    
    private func convertCoordSystems()->CGAffineTransform {
        let size = coreImage.extent.size
        let transform = CGAffineTransform(scaleX: 1, y: -1)
        return transform.translatedBy(x: 0, y: -size.height)
    }
    
    private func convertPosition(_ face:CIFeature, transform:CGAffineTransform)->CGRect {
        
        var faceViewBounds = face.bounds.applying(transform)
        let imageSize = coreImage.extent.size
        
        let viewSize = inputImageView.bounds.size
        let scale = min(viewSize.width / imageSize.width,
                        viewSize.height / imageSize.height)
        let offsetX = (viewSize.width - imageSize.width * scale) / 2
        let offsetY = (viewSize.height - imageSize.height * scale) / 2
        
        faceViewBounds = faceViewBounds.applying(
            CGAffineTransform(scaleX: scale, y: scale)
        )
        
        faceViewBounds.origin.x += offsetX
        faceViewBounds.origin.y += offsetY
        
        return faceViewBounds
    }
    
}
