//
//  TextDisplay.swift
//  BottonsThatDoThings
//
//  Created by jeffrey chiang on 9/30/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation

class TextDisplay  {
    let textDisplay: String
    
    init(textDisplay: String) {
        self.textDisplay = textDisplay
    }
    func get() -> String{
        return self.textDisplay
    }
}
