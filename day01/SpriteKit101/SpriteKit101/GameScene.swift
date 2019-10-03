//
//  GameScene.swift
//  SpriteKit101
//
//  Created by jeffrey chiang on 10/2/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    let player = SKSpriteNode(imageNamed: "space")
    let scaleDownAction = SKAction.scale(to: 0.00001, duration: 5)
    
    override func didMove(to view: SKView) {
        
        player.name = "spaceship"
        player.zPosition = 1
        addChild(player)
        player.run(scaleDownAction)
    }
}
