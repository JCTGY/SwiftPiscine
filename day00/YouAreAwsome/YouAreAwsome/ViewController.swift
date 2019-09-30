//
//  ViewController.swift
//  YouAreAwsome
//
//  Created by jeffrey chiang on 9/29/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PrintHello: UILabel!
    @IBAction func HelloWorld(_ sender: UIButton) {
        print("Hello World!")
        PrintHello.text = "Hello World!"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

