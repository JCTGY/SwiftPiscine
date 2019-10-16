//
//  ViewController.swift
//  MultiTouch
//
//  Created by jeffrey chiang on 10/15/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imageController = ImageController()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageController.scrollView)
        imageController.imageArray = [UIImage(named: "Fire")!, UIImage(named: "Snow")!, UIImage(named: "Wind.jpg")!]
        imageController.setupImages(imageController.imageArray)
        // Do any additional setup after loading the view.
    }

}

