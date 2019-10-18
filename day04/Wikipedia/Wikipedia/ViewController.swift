//
//  ViewController.swift
//  Wikipedia
//
//  Created by jeffrey chiang on 10/18/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wikipedia = Wikipedia()
    var query = WikiQuery()
    var wikititle: String?
    var wikitext: String?

    @IBOutlet weak var wikiTtile: UILabel!
    @IBOutlet weak var wikiText: UILabel!
    override func viewDidLoad() {

        super.viewDidLoad()
        wikipedia.fetchPage(){
            object in
            self.query = object!
            for (_, data) in self.query.query!.pages!{
                self.wikititle = data.title
                self.wikitext = data.extract
            }
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func Start(_ sender: UIButton) {
        changeText()
    }
    func changeText(){
            self.wikiText.text = self.wikitext
            print(self.wikitext)
            self.wikiTtile.text = self.wikititle
    }
    
}

