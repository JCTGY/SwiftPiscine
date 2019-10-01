//
//  ViewController.swift
//  BottonsThatDoThings
//
//  Created by jeffrey chiang on 9/30/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var _textDisplay = "How awesome you are?"
    var fontColor = UIColor.black
    lazy var display: TextDisplay = TextDisplay(textDisplay: _textDisplay)
    @IBOutlet weak var DisplayText: UILabel!
    @IBAction func FontOne(_ sender: UIButton) {
        fontColor = UIColor.brown
        switchFonts(_fontsName: "TimesNewRomanPS-ItalicMT" , _size: 30)
    }
    @IBAction func FontTwo(_ sender: UIButton) {
        fontColor = UIColor.purple
        switchFonts(_fontsName: "TZapfino" , _size: 32)
    }
    @IBOutlet weak var stackView: UIStackView!
    func switchFonts(_fontsName:String, _size: CGFloat){
          let alert = UIAlertController(title: "Switch Font", message: "You are going to switch fonts", preferredStyle: UIAlertController.Style.alert)
          // add an action (button)
          alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
          // show the alert
          self.present(alert, animated: true, completion: nil)
        DisplayText.textColor = fontColor
        DisplayText.text = display.textDisplay
        DisplayText.font = UIFont.init(name: _fontsName, size: _size)
    }
    

}

