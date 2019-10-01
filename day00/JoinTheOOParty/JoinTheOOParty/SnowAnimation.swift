//
//  SnowAnimation.swift
//  JoinTheOOParty
//
//  Created by jeffrey chiang on 9/30/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import UIKit

class SnowAnimation {
    public static var emmiterCells = Array<CAEmitterCell>()
    public static var emitter =  CAEmitterLayer()
    
    static func get(with images: Array<UIImage>) {
        emitter.emitterShape = CAEmitterLayerEmitterShape.line
        for image in images {
            self.setEmmiterCell(with: image)
        }
        emitter.emitterCells = emmiterCells
    }
    
    static func setEmmiterCell(with image: UIImage){
        let emmiterCell = CAEmitterCell()
        emmiterCell.birthRate = 1
        emmiterCell.lifetime = 20
        emmiterCell.velocity = CGFloat.random(in: 30...120)
        emmiterCell.emissionLongitude = (180 * (.pi / 180))
        emmiterCell.contents = image.cgImage
        emmiterCell.spin = 1
        emmiterCells.append(emmiterCell)
    }
    
}
