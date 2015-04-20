//
//  Homebody.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/19/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import Foundation
import SpriteKit

class ChoosePicture: SKScene {
    
    var thumb_guy1 = SKSpriteNode(imageNamed: "thumb_guy1.png")
    var thumb_guy2 = SKSpriteNode(imageNamed: "thumb_guy2.png")
    var thumb_guy3 = SKSpriteNode(imageNamed: "thumb_guy3.png")
    var thumb_girl1 = SKSpriteNode(imageNamed: "thumb_girl1.png")
    
    var thumb_guy1_select = SKTexture(imageNamed: "thumb_guy1_select.png")
    var thumb_guy2_select = SKTexture(imageNamed: "thumb_guy2_select.png")
    var thumb_guy3_select = SKTexture(imageNamed: "thumb_guy3_select.png")
    var thumb_girl1_select = SKTexture(imageNamed: "thumb_girl1_select.png")
    
    var thumb_guy1_unselect = SKTexture(imageNamed: "thumb_guy1.png")
    var thumb_guy2_unselect = SKTexture(imageNamed: "thumb_guy2.png")
    var thumb_guy3_unselect = SKTexture(imageNamed: "thumb_guy3.png")
    var thumb_girl1_unselect = SKTexture(imageNamed: "thumb_girl1.png")
    
    var img_chooseFace = SKSpriteNode(imageNamed: "img_chooseFace.png")
    var img_tapToStart = SKTexture(imageNamed: "img_tapToStart.png")
    
    var sound_choose1 = SKAction.playSoundFileNamed("choose1.wav", waitForCompletion: true)
    var sound_choose2 = SKAction.playSoundFileNamed("choose2.wav", waitForCompletion: true)
    
    var chooseMusic = SKAction.playSoundFileNamed("chooseMusic.wav", waitForCompletion: true)
    
    var faceSelection = 0
    
    override func didMoveToView(view: SKView) {
        
        var playMusicForever = SKAction.repeatActionForever(chooseMusic)
        
        runAction(playMusicForever, withKey: "chooseMusic")
        
        self.name = "ChoosePicture"
        
        backgroundColor = SKColor.whiteColor()
        
        thumb_guy1.zPosition = CGFloat(0.6)
        thumb_guy2.zPosition = CGFloat(0.7)
        thumb_girl1.zPosition = CGFloat(0.8)
        thumb_guy3.zPosition = CGFloat(0.9)
        
        thumb_guy1.position = CGPointMake(80, 400)
        thumb_guy2.position = CGPointMake(240, 400)
        
        thumb_girl1.position = CGPointMake(80, 80)
        thumb_guy3.position = CGPointMake(240, 80)
        
        img_chooseFace.zPosition = CGFloat(0.9)
        img_chooseFace.position = CGPointMake(160, 250)
        
        
        self.addChild(thumb_guy1)
        self.addChild(thumb_guy2)
        self.addChild(thumb_girl1)
        self.addChild(thumb_guy3)
        self.addChild(img_chooseFace)
        
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch in (touches as! Set<UITouch>) {
            
            let location = touch.locationInNode(self)
            let nodeTouch = nodeAtPoint(location)
            
            if(nodeTouch == thumb_guy1){
                runAction(sound_choose1)
                
                
                faceSelection = 1
                
            }
                
            else if(nodeTouch == thumb_guy2){
                runAction(sound_choose1)
                
                
                faceSelection = 2
                
            }
                
            else if(nodeTouch == thumb_guy3){
                runAction(sound_choose1)
                
                
                faceSelection = 4
                
            }
                
            else if(nodeTouch == thumb_girl1){
                runAction(sound_choose1)
                
                
                faceSelection = 3
                
            }
            else{
                
            }
            
            if(faceSelection == 1){
                thumb_guy1.texture = thumb_guy1_select
                thumb_guy2.texture = thumb_guy2_unselect
                thumb_girl1.texture = thumb_girl1_unselect
                thumb_guy3.texture = thumb_guy3_unselect
                
                if(nodeTouch == img_chooseFace){
                    runAction(sound_choose2)
                    self.view?.presentScene(Pop(size: self.scene!.size, choice: 1), transition: SKTransition.flipHorizontalWithDuration(0.5))
                }
            }
            else if(faceSelection == 2){
                thumb_guy1.texture = thumb_guy1_unselect
                thumb_guy2.texture = thumb_guy2_select
                thumb_girl1.texture = thumb_girl1_unselect
                thumb_guy3.texture = thumb_guy3_unselect
                
                if(nodeTouch == img_chooseFace){
                    runAction(sound_choose2)
                    self.view?.presentScene(Pop(size: self.scene!.size, choice: 2), transition: SKTransition.flipHorizontalWithDuration(0.5))
                }
            }
            else if(faceSelection == 3){
                thumb_guy1.texture = thumb_guy1_unselect
                thumb_guy2.texture = thumb_guy2_unselect
                thumb_girl1.texture = thumb_girl1_select
                thumb_guy3.texture = thumb_guy3_unselect
                
                if(nodeTouch == img_chooseFace){
                    runAction(sound_choose2)
                    self.view?.presentScene(Pop(size: self.scene!.size, choice: 3), transition: SKTransition.flipHorizontalWithDuration(0.5))
                }
            }
            else if(faceSelection == 4){
                thumb_guy1.texture = thumb_guy1_unselect
                thumb_guy2.texture = thumb_guy2_unselect
                thumb_girl1.texture = thumb_girl1_unselect
                thumb_guy3.texture = thumb_guy3_select
                
                if(nodeTouch == img_chooseFace){
                    runAction(sound_choose2)
                    self.view?.presentScene(Pop(size: self.scene!.size, choice: 4), transition: SKTransition.flipHorizontalWithDuration(0.5))
                }
            }
            
            if(faceSelection != 0){
                img_chooseFace.texture = img_tapToStart
            }
        }
        
    }
    
    
}
