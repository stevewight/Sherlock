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
    
    var framerIndex = 0
    var color = UIColor.white
    var width = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
        let baseImage = UIImage(named:"image_3.jpg")!
        imageView.image = baseImage
        //pixellateFaces()
        frameFaces()
        //pixellateText()
        //frameText()
    }
    
    // @IBAction Methods
    
    @IBAction func framerSegmentChanged(_ sender: UISegmentedControl) {
        imageView.subviews.forEach({ $0.removeFromSuperview() })
        framerIndex = sender.selectedSegmentIndex
        frameFaces()
    }
    
    @IBAction func colorSegmentChanged(_ sender: UISegmentedControl) {
        imageView.subviews.forEach({ $0.removeFromSuperview() })
        color = colorWith(index: sender.selectedSegmentIndex)
        frameFaces()
    }
    
    @IBAction func widthSegmentChanged(_ sender: UISegmentedControl) {
        imageView.subviews.forEach({ $0.removeFromSuperview() })
        width = widthWith(index: sender.selectedSegmentIndex)
        frameFaces()
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
        faceFramer.shapeColor = color
        faceFramer.borderWidth = width
        if framerIndex == 0 {
            faceFramer.radial()
        } else {
            faceFramer.box()
        }
    }
    
    private func frameText() {
        let textFramer = TextFramer(imageView)
        textFramer.box()
    }
    
    private func widthWith(index:Int)->Double {
        switch index {
        case 0:
            return 0.5
        case 1:
            return 1.5
        case 2:
            return 3.5
        default:
            return 1.5
        }
    }
    
    private func colorWith(index:Int)->UIColor {
        switch index {
        case 0:
            return UIColor.white
        case 1:
            return UIColor.blue
        case 2:
            return UIColor.red
        default:
            return UIColor.gray
        }
    }

}

