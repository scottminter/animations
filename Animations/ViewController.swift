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
    var timer = Timer()

    // Fade In
    @IBAction func fadeIn(_ sender: Any) {
        // set alpha to 0
        image.alpha = 0
        // then fade image in over 1 second
        UIView.animate(withDuration: 3, animations: {
            self.image.alpha = 1
        })
    }
    
    // Slide In
    @IBAction func slideIn(_ sender: Any) {
        // change center of image
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        // then move back to center
        UIView.animate(withDuration: 2, animations: {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        })
    }
    
    // Grow
    @IBAction func grow(_ sender: Any) {
        
        image.frame = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        UIView.animate(withDuration: 3, animations: {
            self.image.frame = CGRect(x: self.image.center.x, y: self.image.center.y, width: 200, height: 200)
        })
    }
    
    @IBAction func stopImages(_ sender: Any) {
        timer.invalidate()
    }
    
    @IBAction func nextImage(_ sender: Any) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.nextImg), userInfo: nil, repeats: true)
    }

    @IBAction func prevImage(_ sender: Any) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(ViewController.prevImg), userInfo: nil, repeats: true)
    }

    func nextImg() {
        print("Change image")
        imgIndex += 1
        
        if imgIndex > 21 {
            imgIndex = 0
        }
        
        let imgName: String = "frame_" + String(imgIndex) + "_delay-0.1s.gif"
        print("next: \(imgName)")
        image.image = UIImage(named: imgName)
    }
    
    func prevImg() {
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
        
        //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.changeImg), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

