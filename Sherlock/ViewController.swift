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
        let baseImage = UIImage(named:"image_3.jpg")!
        imageView.image = baseImage
        //pixellateFaces()
        frameFaces()
        //pixellateText()
        //frameText()
    }
    
    // (self) Methods
    
    private func pixellateFaces() {
        let faceObscure = FaceObscure(imageView.image!)
        //imageView.image = faceObscure.pixelate()
        imageView.image = faceObscure.crystalize()
    }
    
    private func pixellateText() {
        let textObscure = TextObscure(imageView.image!)
        //imageView.image = textObscure.crystalize()
        imageView.image = textObscure.pixelate()
    }
    
    private func frameFaces() {
        let faceFramer = FaceFramer(imageView)
        faceFramer.shapeColor = UIColor.white
        //faceFramer.box()
        faceFramer.radial()
    }
    
    private func frameText() {
        let textFramer = TextFramer(imageView)
        textFramer.box()
    }

}

