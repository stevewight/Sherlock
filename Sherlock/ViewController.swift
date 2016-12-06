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
        let baseImage = UIImage(named:"group_stock_2.jpg")!
        imageView.image = baseImage
        //pixellateFaces()
        boxFaces()
    }
    
    // (self) Methods
    
    private func pixellateFaces() {
        let faceObscure = FaceObscure(imageView.image!)
        //imageView.image = faceObscure.pixelate()
        imageView.image = faceObscure.crystalize()
    }
    
    private func boxFaces() {
        let facePainter = FacePaint(imageView)
        facePainter.box()
    }

}

