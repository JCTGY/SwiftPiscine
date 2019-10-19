//
//  ViewController.swift
//  UIGestures
//
//  Created by jeffrey chiang on 10/18/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let downtSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTaps(_:)))
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        upSwipe.direction = .up
        downtSwipe.direction = .down
        tap.numberOfTapsRequired = 1
        pinch.scale = 1.0
        

        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        view.addGestureRecognizer(upSwipe)
        view.addGestureRecognizer(downtSwipe)
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(pinch)
        view.addGestureRecognizer(rotation)
        
        
    }
    
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
            
        if (sender.direction == .left) {
            view.backgroundColor = .purple
        }
        if (sender.direction == .right) {
            view.backgroundColor = .blue
        }
        if (sender.direction == .up){
            view.backgroundColor = .yellow
        }
        if (sender.direction == .down){
            view.backgroundColor = .red
        }
    }
    
    @objc func handleTaps(_ sender: UITapGestureRecognizer){
        
        if (sender.numberOfTapsRequired == 1){
            view.backgroundColor = .systemPink
        }
    }
    
    @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
        if (sender.scale == 1.0){
            view.backgroundColor = .green
        }
    }
    
    @objc func handleRotation(_ sender: UIRotationGestureRecognizer){
            guard sender.view != nil else { return }
                 
            if sender.state == .began || sender.state == .changed {
               sender.view?.transform = sender.view!.transform.rotated(by: sender.rotation)
               sender.rotation = 0
                view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        }
    }
}

    
    


