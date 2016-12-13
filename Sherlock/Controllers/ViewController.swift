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
        frameFaces(index:0)
        //pixellateText()
        //frameText()
    }
    
    // @IBAction Methods
    
    @IBAction func framerSegmentChanged(_ sender: UISegmentedControl) {
        imageView.subviews.forEach({ $0.removeFromSuperview() })
        frameFaces(index: sender.selectedSegmentIndex)
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
    
    private func frameFaces(index:Int) {
        let faceFramer = FaceFramer(imageView)
        faceFramer.shapeColor = UIColor.white
        faceFramer.borderWidth = 1.5
        if index == 0 {
            faceFramer.radial()
        } else {
            faceFramer.box()
        }
    }
    
    private func frameText() {
        let textFramer = TextFramer(imageView)
        textFramer.box()
    }

}

