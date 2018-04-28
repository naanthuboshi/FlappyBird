//
//  GameScene.swift
//  FlappyBird
//
//  Created by Mac Owner on 2018/04/26.
//  Copyright © 2018年 Mac Owner. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView){
        backgroundColor = UIColor(red: 0.15, green:0.75, blue: 0.90, alpha: 1)
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = .nearest
        let groundSprite = SKSpriteNode(texture: groundTexture)
        x: groundTexture.size().width * 0.5,
        y: groundTexture.size().height * 0.5
        )
        
        let birdNode = SKSpriteNode(imageNamed: "bird1”)
        
    }
    addChild(groundSprite)
    
}







