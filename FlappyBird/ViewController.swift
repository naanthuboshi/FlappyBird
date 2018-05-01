//
//  ViewController.swift
//  FlappyBird
//
//  Created by Mac Owner on 2018/04/26.
//  Copyright © 2018年 Mac Owner. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let skView = self.view as! SKView
        
        skView.showsFPS = true
        
        skView.showsNodeCount = true
        
        let scene = GameScene(size:skView.frame.size)
        
        skView.presentScene(scene)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
      override var prefersStatusBarHidden: Bool {
        get{
            return true
        }
    }
    
}


