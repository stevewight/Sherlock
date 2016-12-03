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
    
}
