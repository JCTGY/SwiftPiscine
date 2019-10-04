//
//  ObjectNode.swift
//  CollisionGame
//
//  Created by jeffrey chiang on 10/3/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import Foundation
import SpriteKit

class ObjectNode: SKSpriteNode {
    
    var objectType: GameObjecs
    
    init(type: GameObjecs, startPosition: CGPoint, xOffset: CGFloat, moveStraight: Bool) {
        self.objectType = type

        let texture = SKTexture(imageNamed: type.name)
        super.init(texture: texture, color: .white, size: texture.size())

        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.categoryBitMask = CollisionType.object.rawValue
        physicsBody?.collisionBitMask = CollisionType.player.rawValue
        physicsBody?.contactTestBitMask = CollisionType.player.rawValue 
        name = "object"
        position = CGPoint(x: startPosition.y, y: startPosition.x + xOffset)

        configureMovement(moveStraight)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("LOL NO")
    }

    func configureMovement(_ moveStraight: Bool) {
        let path = UIBezierPath()
        path.move(to: .zero)

        if moveStraight {
            path.addLine(to: CGPoint(x: -10000, y: 0))
        } else {
            path.addCurve(to: CGPoint(x: -3500, y: 0), controlPoint1: CGPoint(x: 0, y: -position.y * 4), controlPoint2: CGPoint(x: -1000, y: -position.y))
        }
        // TODO speed not fix yet
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 800)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
}
