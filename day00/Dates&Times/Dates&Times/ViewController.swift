//
//  ViewController.swift
//  Dates&Times
//
//  Created by jeffrey chiang on 10/1/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    lazy var eventNote = eventNotification()
    var pickerData: [String] = ["Buy Food", "Exercise", "Go to Lab", "Sleep", "Cook Food"]

    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.Picker.delegate = self
        self.Picker.dataSource = self
        Start()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: pickerData[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    func Start()
    {
        datePicker.setValue(UIColor.white, forKeyPath: "textColor")
        datePicker.timeZone = NSTimeZone.local
     }
    
    @IBAction func clickOkay(_ sender: UIButton) {
        let currentTitle = pickerData[self.Picker.selectedRow(inComponent: 0)]
        let currentDate = datePicker.date
        let currentCalendar = datePicker.calendar
        var currentTime = DateComponents()
        currentTime.quarter = nil
        currentTime = (currentCalendar!.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate))
        eventNote.addNotification(currentTitle: currentTitle, currentTime: currentTime)
        eventNote.schedule()
    }
}
