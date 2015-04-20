//
//  Homebody.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/19/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import Foundation
import SpriteKit

class GameScene: SKScene {
    
    var sound_homebody = SKAction.playSoundFileNamed("misc_homebodyLogo.wav", waitForCompletion: false)
    var img_homebodyLogo = SKSpriteNode(imageNamed: "img_homebodyLogo.png")
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.blackColor()
        
        img_homebodyLogo.zPosition = CGFloat(0.1)
        
        img_homebodyLogo.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        img_homebodyLogo.alpha = 0
        self.addChild(img_homebodyLogo)
        
        
        runAction(sound_homebody)
        
        var fadeIn = SKAction.fadeInWithDuration(1.5)
        var fadeWait = SKAction.waitForDuration(2.0)
        var fadeOut = SKAction.fadeOutWithDuration(1.5)
        
        var transAction = SKAction.runBlock{
            self.view?.presentScene(MainMenu(size: self.scene!.size), transition: SKTransition.flipHorizontalWithDuration(0.5))
        }
        var fadeSequence = SKAction.sequence([fadeIn, fadeWait, fadeOut, transAction])
        
        img_homebodyLogo.runAction(fadeSequence)
        
        
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
    }
    
    
}
