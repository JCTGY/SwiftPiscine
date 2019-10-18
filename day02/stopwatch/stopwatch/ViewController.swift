//
//  ViewController.swift
//  stopwatch
//
//  Created by jeffrey chiang on 10/16/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    
    var (hours, minutes, seconds, freactions) = (0, 0, 0, 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var timerLable: UILabel!
    
    @IBAction func reset(_ sender: UIButton) {
        timer.invalidate()
        (hours, minutes, seconds, freactions) = (0, 0, 0, 0)
        timerLable.text = "00:00:00.00"
        
    }
    @IBOutlet weak var startPauseButton: UIButton!
    @IBAction func startPause(_ sender: UIButton) {
        if (startPauseButton.currentTitle == "Start"){
            timer.invalidate()
              timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.setTimer), userInfo: nil, repeats: true)
            startPauseButton.setTitle("Pause", for: .normal)
        }
        else if (startPauseButton.currentTitle == "Pause"){
            timer.invalidate()
            startPauseButton.setTitle("Start", for: .normal)        }
    }
    @objc func setTimer(){
        
        freactions += 1
        if (freactions == 99){
            freactions = 0
            seconds += 1
        }
        if (seconds == 60){
            seconds = 0
            minutes += 1
        }
        if (minutes == 60) {
            minutes = 0
            hours += 1
        }
        if (hours == 24){
            hours = 0
        }
        timerLable.text = String(format: "%02d:%02d:%02d.%02d", hours, minutes, seconds, freactions)
    }
    
}

