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
        detectFaces()
    }
    
    // (self) Methods

    private func prepareDetector() {
        detector = DetectorFactory.face()
    }
    
    private func setupFilter() {
        filter = CIFilter(
            name: "CIPixellate",
            withInputParameters: [kCIInputIntensityKey: 0.75]
        )
    }
    
    private func coreImage()->CIImage {
        let image = UIImage(named:"image_1.jpg")!
        return CIImage(image: image)!
    }
    
    private func detectFaces() {
        let faces = detector.features(in: coreImage())
        
        for face in faces {
            print("face: \(face)")
        }
    }

}

