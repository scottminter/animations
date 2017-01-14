//
//  ViewController.swift
//  Animations
//
//  Created by Scott Minter on 1/12/17.
//  Copyright © 2017 Scott Minter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var imgIndex: Int = 0

    @IBAction func nextImage(_ sender: Any) {
        imgIndex += 1
        
        if imgIndex > 21 {
            imgIndex = 0
        }

        let imgName: String = "frame_" + String(imgIndex) + "_delay-0.1s.gif"
        print("next: \(imgName)")
        image.image = UIImage(named: imgName)
    }

    @IBAction func prevImage(_ sender: Any) {
        imgIndex -= 1
        
        if imgIndex < 0 {
            imgIndex = 21
        }

        let imgName: String = "frame_" + String(imgIndex) + "_delay-0.1s.gif"
        print("next: \(imgName)")
        image.image = UIImage(named: imgName)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

