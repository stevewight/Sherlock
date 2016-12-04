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

    override func viewDidLoad() {
        super.viewDidLoad()
        let baseImage = UIImage(named:"image_4.jpg")!
        pixellateFaces(image: baseImage)
    }
    
    // (self) Methods
    
    private func pixellateFaces(image:UIImage) {
        let pixelFace = PixelFace(image)
        imageView.image = pixelFace.pixellate()
    }

}

