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
    var baseImage:CIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareDetector()
        prepareImage()
        detectFaces()
    }
    
    // (self) Methods

    private func prepareDetector() {
        detector = DetectorFactory.face()
    }
    
    private func prepareImage() {
        let image = UIImage(named:"group_stock_2.jpg")!
        baseImage = CIImage(image: image)!
    }
    
    private func detectFaces() {
        let faces = detector.features(in: baseImage)
        let pixelFace = PixelFace(baseImage, faces)
        imageView.image = pixelFace.pixellate()
    }

}

