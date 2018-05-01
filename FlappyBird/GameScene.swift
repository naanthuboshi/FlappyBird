//
//  GameScene.swift
//  FlappyBird
//
//  Created by Mac Owner on 2018/04/26.
//  Copyright © 2018年 Mac Owner. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var scrollNode:SKNode!
    var wallNode:SKNode!
    var bird:SKSpriteNode!
    
    override func didMove(to view: SKView){
        backgroundColor = UIColor(red: 0.15, green: 0.75, blue: 0.90, alpha: 1)
        
        scrollNode = SKNode()
        addChild(scrollNode)
        
        setupGround()
        setupCloud()
        setupWall()
        setupBird()

    
}


func setupGround() {
    let groundTexture = SKTexture(imageNamed: "ground")
    groundTexture.filteringMode = .nearest
    
    let needNumber = Int(self.frame.size.width / groundTexture.size().width) + 2
    
    let moveGround = SKAction.moveBy(x: -groundTexture.size().width , y: 0, duration: 5.0)
    
    let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0.0)
    
    let repeatScrollGround = SKAction.repeatForever(SKAction.sequence([moveGround, resetGround]))
    
    for i in 0..<needNumber {
        let sprite = SKSpriteNode(texture: groundTexture)
        
        sprite.position = CGPoint(
            x: groundTexture.size().width * (CGFloat(i) + 0.5),
            y: groundTexture.size().height * 0.5
        )
        

        
        sprite.run(repeatScrollGround)
        scrollNode.addChild(sprite)
        
    }
    
}
func setupCloud() {
    let cloudTexture = SKTexture(imageNamed: "cloud")
    cloudTexture.filteringMode = .nearest
    
    let needCloudNumber = Int(self.frame.size.width / cloudTexture.size().width) + 2
    let moveCloud = SKAction.moveBy(x: -cloudTexture.size().width , y: 0, duration: 20.0)
    let resetCloud = SKAction.moveBy(x: cloudTexture.size().width, y: 0, duration: 0.0)
    let repeatScrollCloud = SKAction.repeatForever(SKAction.sequence([moveCloud, resetCloud]))
    
    for i in 0..<needCloudNumber {
        let sprite = SKSpriteNode(texture: cloudTexture)
        sprite.zPosition = -100
        
        sprite.position = CGPoint(
            x: cloudTexture.size().width * (CGFloat(i) + 0.5),
            y: self.size.height - cloudTexture.size().height * 0.5
        )
        
        sprite.run(repeatScrollCloud)
        
        
        scrollNode.addChild(sprite)
    }
}
func setupWall() {
    let wallTexture = SKTexture(imageNamed: "wall")
    wallTexture.filteringMode = .linear
    
    let movingDistance = CGFloat(self.frame.size.width + wallTexture.size().width)
    let moveWall = SKAction.moveBy(x: -movingDistance, y: 0, duration:4.0)
    let removeWall = SKAction.removeFromParent()
    let wallAnimation = SKAction.sequence([moveWall, removeWall])
    
    let createWallAnimation = SKAction.run({
        let wall = SKNode()
        wall.position = CGPoint(x: self.frame.size.width + wallTexture.size().width / 2, y: 0.0)
        wall.zPosition = -50.0
        
        let center_y = self.frame.size.height / 2
        
        let random_y_range = self.frame.size.height / 4
        
        let under_wall_lowest_y = UInt32( center_y - wallTexture.size().height / 2 -  random_y_range / 2)
        
        let random_y = arc4random_uniform( UInt32(random_y_range) )
        
        let under_wall_y = CGFloat(under_wall_lowest_y + random_y)
        
        let slit_length = self.frame.size.height / 6
        
        
        let under = SKSpriteNode(texture: wallTexture)
        under.position = CGPoint(x: 0.0, y: under_wall_y)
        wall.addChild(under)
        
        
        let upper = SKSpriteNode(texture: wallTexture)
        upper.position = CGPoint(x: 0.0, y: under_wall_y + wallTexture.size().height + slit_length)
        
        wall.addChild(upper)
        wall.run(wallAnimation)
        
        self.wallNode.addChild(wall)
    })
    
    
    let waitAnimation = SKAction.wait(forDuration: 2)
    
    
    let repeatForeverAnimation = SKAction.repeatForever(SKAction.sequence([createWallAnimation, waitAnimation]))
    
     wallNode.run(repeatForeverAnimation)
    
}
    func setupBird(){
        
        let birdNode = SKSpriteNode(imageNamed: "bird1")
        
        let birdTextureA = SKTexture(imageNamed: "bird_a")
        birdTextureA.filteringMode = .linear
        let birdTextureB = SKTexture(imageNamed: "bird_b")
        birdTextureB.filteringMode = .linear
        
        bird = SKSpriteNode(texture: birdTextureA)
        bird.position = CGPoint(x: self.frame.size.width * 0.2, y:self.frame.size.height * 0.7)
        
        bird = SKSpriteNode(texture: birdTextureA)
       bird.position = CGPoint(x: self.frame.size.width * 0.2, y:self.frame.size.height * 0.7)
  
        bird.run(flap)
        addChild(bird)
    }
    }
        




