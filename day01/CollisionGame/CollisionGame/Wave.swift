//
//  Wave.swift
//  CollisionGame
//
//  Created by jeffrey chiang on 10/3/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import SpriteKit

struct Wave: Codable {
    struct WaveObject: Codable {
        let position: Int
        let xOffset: CGFloat
        let moveStraight: Bool
    }

    let name: String
    let objects: [WaveObject]
}
