//
//  ViewController.swift
//  Picture
//
//  Created by jeffrey chiang on 10/4/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imagePicker: ImagePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)

    }

    @IBOutlet weak var ImageViewer: UIImageView!
    
    @IBAction func Click(_ sender: UIButton) {
        self.imagePicker.present(from: sender)

    }
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.ImageViewer.image = image
    }
}

