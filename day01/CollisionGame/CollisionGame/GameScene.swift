//
//  GameScene.swift
//  CollisionGame
//
//  Created by jeffrey chiang on 10/2/19.
//  Copyright © 2019 jeffrey chiang. All rights reserved.
//

import SpriteKit
import CoreMotion

enum CollisionType: UInt32 {
    
    case player = 1
    case object = 2
}

class GameScene: SKScene {
    
    let motionManager = CMMotionManager()
    let player = SKSpriteNode(imageNamed: "basket")
    var lastTouchPosition: CGPoint?

    let waves = Bundle.main.decode([Wave].self, from: "Wave.json")
    let objectsType = Bundle.main.decode([GameObjecs].self, from: "Objects.json")

    var isPlayerAlive = true
    var waveNumber = 0
    var levelNumber = 0
    
    let positions = Array(stride(from: -320, through: 320, by: 80))


    override func didMove(to view: SKView) {
        // Get label node from scene and store it for use later
        physicsWorld.gravity = .zero

        if let particles = SKEmitterNode(fileNamed: "Particles") {
            particles.position = CGPoint(x: 0, y: 900)
            particles.advanceSimulationTime(60)
            particles.zPosition = -1
            addChild(particles)
        }

//        Try SKConstraint The code would look something like this, and would constrain sprite to the scene. This code goes in your scene file:


        player.name = "player"
        player.position.y = frame.minY + 75
        player.zPosition = 1
        
        player.physicsBody = SKPhysicsBody(texture: player.texture!, size: player.texture!.size())
        player.physicsBody?.categoryBitMask = CollisionType.player.rawValue
        player.physicsBody?.collisionBitMask = CollisionType.object.rawValue
        player.physicsBody?.contactTestBitMask = CollisionType.object.rawValue
        addChild(player)
        motionManager.startAccelerometerUpdates()
    }
    
    
    func createWave() {
        guard isPlayerAlive else { return }

        if waveNumber == waves.count {
            levelNumber += 1
            waveNumber = 0
        }

        let currentWave = waves[waveNumber]
        waveNumber += 1

        let maximumObjectsType = min(objectsType.count, levelNumber + 1)
        let objectType = Int.random(in: 0..<maximumObjectsType)

        let objectOffsetX: CGFloat = 50
        let objectStartX = 900

        if currentWave.objects.isEmpty {
            for (index, position) in positions.shuffled().enumerated() {
                let object = ObjectNode(type: objectsType[objectType], startPosition: CGPoint(x: objectStartX, y: position), xOffset: objectOffsetX * CGFloat(index * 3), moveStraight: true)
                addChild(object)
            }
        } else {
            for object in currentWave.objects {
                let node = ObjectNode(type: objectsType[objectType], startPosition: CGPoint(x: objectStartX, y: positions[object.position]), xOffset: objectOffsetX * object.xOffset, moveStraight: object.moveStraight)
                addChild(node)
            }
        }
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        lastTouchPosition = location
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        lastTouchPosition = location
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTouchPosition = nil
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        #if targetEnvironment(simulator)
        if let currentTouch = lastTouchPosition {
            let diff = CGPoint(x: currentTouch.x - player.position.x, y: currentTouch.y - player.position.y)
            physicsWorld.gravity = CGVector(dx: diff.x / 100, dy: diff.y / 100)
            let xRange = SKRange(lowerLimit:frame.minX + 50,upperLimit:frame.maxX - 50)
            let yRange = SKRange(lowerLimit:frame.minY + 50,upperLimit:frame.maxY - 50)
            //sprite.constraints = [SKConstraint.positionX(xRange,Y:yRange)] // iOS 9
            player.constraints = [SKConstraint.positionX(xRange,y:yRange)]
        }
        #else
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accelerometerData.acceleration.y * -50, dy: accelerometerData.acceleration.x * 50)
            if player.position.x <= frame.minX {
                player.position.x = frame.minX
            } else if (player.position.x >= frame.maxX){
                player.position.x = frame.maxX
            }
        }
        #endif
        
        
        let activeObjects = children.compactMap { $0 as? ObjectNode }

        if activeObjects.isEmpty {
            createWave()
        }

        for object in activeObjects {
            guard frame.intersects(object.frame) else { continue }
        }
    }
}
