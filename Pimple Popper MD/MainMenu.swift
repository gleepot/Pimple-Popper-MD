//
//  Homebody.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/19/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenu: SKScene {
    
    var music_main = SKAction.playSoundFileNamed("menuMusic.wav", waitForCompletion: true)
    var sound_flip1 = SKAction.playSoundFileNamed("flip1.wav", waitForCompletion: false)
    var bg_main = SKSpriteNode(imageNamed: "bg_main.png")
    
    override func didMoveToView(view: SKView) {
        
        self.name = "MainMenu"
        
        backgroundColor = SKColor.blackColor()
        
        bg_main.zPosition = CGFloat(0.5)
        
        bg_main.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        bg_main.alpha = 0
        self.addChild(bg_main)
        
        var playMusicForever = SKAction.repeatActionForever(music_main)
        
        runAction(playMusicForever, withKey: "menuMusic")
        
        var fadeIn = SKAction.fadeInWithDuration(1.5)
        var fadeOut = SKAction.fadeOutWithDuration(1.5)
        
        bg_main.runAction(fadeIn)
        
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let nodeTouch = nodeAtPoint(location)
            
            if(nodeTouch == bg_main){
                runAction(sound_flip1)
                removeActionForKey("menuMusic")
                self.view?.presentScene(ChoosePicture(size: self.scene!.size), transition: SKTransition.flipHorizontalWithDuration(0.5))
                
            }
            
        }
        
    }
    
    
}
