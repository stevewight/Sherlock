//
//  ObscureVC.swift
//  Sherlock
//
//  Created by Steve on 12/13/16.
//  Copyright © 2016 Steve Wight. All rights reserved.
//

import UIKit

class ObscureVC: UIViewController {

    let baseImage = UIImage(named:"image_3.jpg")!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = baseImage
        pixellateFaces(index:0)
    }
    
    @IBAction func obscureSegmentChanged(_ sender: UISegmentedControl) {
        pixellateFaces(index: sender.selectedSegmentIndex)
    }
    
    private func pixellateFaces(index:Int) {
        imageView.image = nil
        let faceObscure = FaceObscure(baseImage)
        if index == 0 {
            imageView.image = faceObscure.pixelate()
        } else {
            imageView.image = faceObscure.crystalize()
        }
    }
    
    private func pixellateText() {
        let textObscure = TextObscure(imageView.image!)
        //imageView.image = textObscure.crystalize()
        imageView.image = textObscure.pixelate()
    }

}
