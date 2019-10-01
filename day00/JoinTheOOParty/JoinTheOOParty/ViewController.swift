//
//  ViewController.swift
//  JoinTheOOParty
//
//  Created by jeffrey chiang on 9/30/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var images: [UIImage] = [
        UIImage(named: "snow1.png")!,
        UIImage(named: "snow2.png")!,
        UIImage(named: "snow3.png")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func resizeImages(){
        var index: Int = 0
        for image in images{
            let random = CGFloat.random(in: 8...15)
            images[index] = UIImage.resize(image: image, targetSize: CGSize(width: random, height: random))
            index += 1
        }
    }
    @IBAction func StartButton(_ sender: UIButton) {
        if (SnowAnimation.emitter.birthRate == 0){
            SnowAnimation.emitter.birthRate = 1
        } else {
            resizeImages()
            SnowAnimation.get(with: images)
            SnowAnimation.emitter.emitterPosition = CGPoint(x: view.frame.width / 2, y: 50)
            SnowAnimation.emitter.emitterSize = CGSize(width: view.frame.width, height: 2)
            view.layer.addSublayer(SnowAnimation.emitter)
        }
    }
    
    @IBAction func StopButton(_ sender: UIButton) {
        print(SnowAnimation.emitter.birthRate)
        SnowAnimation.emitter.birthRate = 0
    }
    
   
}

