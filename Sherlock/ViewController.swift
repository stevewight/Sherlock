//
//  ViewController.swift
//  Sherlock
//
//  Created by Steve on 12/2/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var detector:CIDetector!
    var filter:CIFilter!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareDetector()
        setupFilter()
        detectFaces()
        //displayFilteredImage()
    }
    
    // (self) Methods

    private func prepareDetector() {
        detector = DetectorFactory.face()
    }
    
    private func setupFilter() {
        filter = FilterFactory.pixellate(coreImage(), 33.0)
    }
    
    private func displayFilteredImage() {
        imageView.image = UIImage(ciImage: filter.outputImage!)
    }
    
    private func coreImage()->CIImage {
        let image = UIImage(named:"image_1.jpg")!
        return CIImage(image: image)!
    }
    
    private func detectFaces() {
        let faces = detector.features(in: coreImage())
        var mask:CIImage = CIImage()
        
        for face in faces {
            let radial = radialImage(face)
            mask = overCompImage(radial, mask)
        }
        
        let final = maskImage(mask)
        imageView.image = UIImage(ciImage: final)
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
            background: coreImage(),
            mask: mask
        )
        return blendFilter.outputImage!
    }

}

