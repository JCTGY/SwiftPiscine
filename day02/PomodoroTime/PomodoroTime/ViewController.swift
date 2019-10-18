//
//  ViewController.swift
//  PomodoroTime
//
//  Created by jeffrey chiang on 10/17/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    var (minutes, seconds, freactions) = (25, 0, 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var timerLable: UILabel!
    
    @IBOutlet weak var startPauseButton: UIButton!
    
    @IBAction func Reset(_ sender: UIButton) {
        timer.invalidate()
        (minutes, seconds, freactions) = (25, 0, 0)
        timerLable.text = "25:00.00"
    }
    @IBAction func startPause(_ sender: UIButton) {
        if (startPauseButton.currentTitle == "Start"){
            timer.invalidate()
              timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.setTimer), userInfo: nil, repeats: true)
            startPauseButton.setTitle("Pause", for: .normal)
        }
        else if (startPauseButton.currentTitle == "Pause"){
            timer.invalidate()
            startPauseButton.setTitle("Start", for: .normal)
        }
    }
    @objc func setTimer(){
        
        if (freactions == 00){
            freactions = 99
            if (seconds != 00){
                seconds -= 1
            }
        }
        if (seconds == 00){
            seconds = 59
            minutes -= 1
        }
        if (minutes != 00){
            freactions -= 1
        }
        timerLable.text = String(format: "%02d:%02d.%02d", minutes, seconds, freactions)
    }
    
}

