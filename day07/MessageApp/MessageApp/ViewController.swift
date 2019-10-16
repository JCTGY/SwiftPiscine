//
//  ViewController.swift
//  MessageApp
//
//  Created by jeffrey chiang on 10/12/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var ref: DatabaseReference!

        ref = Database.database().reference()
    }


}

