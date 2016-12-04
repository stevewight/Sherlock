//
//  Crystalizer.swift
//  Sherlock
//
//  Created by Steve on 12/4/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class Crystalizer: BaseFilter {

    override init(_ image:CIImage) {
        super.init(image)
        filter = FilterFactory.crystalize(coreImage, 33.0)
    }
    
}
