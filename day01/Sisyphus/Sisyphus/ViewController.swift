//
//  ViewController.swift
//  Sisyphus
//
//  Created by jeffrey chiang on 10/2/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        gameTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(setTimer), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }
    
    var countScore: Double = 30

    @IBOutlet weak var scoreDisplay: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    @IBAction func clickButton(_ sender: UIButton) {
        if (countScore != 0 || countScore <= 100){
            scoreDisplay.text = String(countScore)
            countScore += 1
        }
    }
    
    @objc func setTimer(){
        scoreDisplay.text = String(countScore)
        countScore -= 0.5
        if (countScore == 0 || countScore >= 100){
            editButton.isHidden = true
            gameTimer?.invalidate()
            if (countScore == 0){
                scoreDisplay.textColor = UIColor.red
                scoreDisplay.text = "Game Over"
            } else {
                scoreDisplay.textColor = #colorLiteral(red: 1, green: 0.3601146936, blue: 0.9415329099, alpha: 1)
                scoreDisplay.text = "You Win!"
            }
        }
    }

}

