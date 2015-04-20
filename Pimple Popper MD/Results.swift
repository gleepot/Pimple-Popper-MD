//
//  Homebody.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/19/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import Foundation
import SpriteKit
import Social

class Results: SKScene {
    
    var finalScore = 0
    var userChoice = 0
    
    init(size: CGSize, score: Int, choice: Int){
        super.init(size:size)
        finalScore = score
        userChoice = choice
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var music_main = SKAction.playSoundFileNamed("menuMusic.wav", waitForCompletion: true)
    var sound_flip1 = SKAction.playSoundFileNamed("flip1.wav", waitForCompletion: false)
    var bg_results = SKSpriteNode(imageNamed: "bg_results.png")
    var img_goAgain = SKSpriteNode(imageNamed: "img_goAgain.png")
    var img_copOut = SKSpriteNode(imageNamed: "img_copOut.png")
    
    var icon_twitter = SKSpriteNode(imageNamed: "icon_tweet.png")
    
    override func didMoveToView(view: SKView) {
        
        backgroundColor = SKColor.blackColor()
        
        bg_results.zPosition = CGFloat(0.5)
        
        bg_results.position = CGPointMake(self.size.width / 2, self.size.height / 2)
        bg_results.alpha = 100
        
        self.addChild(bg_results)
        
        img_goAgain.zPosition = CGFloat(0.5)
        
        img_goAgain.position = CGPointMake(self.size.width / 2, 100)
        img_goAgain.alpha = 0
        
        self.addChild(img_goAgain)
        
        img_copOut.zPosition = CGFloat(0.5)
        
        img_copOut.position = CGPointMake(self.size.width / 2, 50)
        img_copOut.alpha = 0
        
        self.addChild(img_copOut)
        
        icon_twitter.zPosition = CGFloat(0.6)
        
        icon_twitter.position = CGPointMake(self.size.width / 2, 150)
        icon_twitter.alpha = 0
        
        self.addChild(icon_twitter)
        
        var playMusicForever = SKAction.repeatActionForever(music_main)
        
        runAction(playMusicForever, withKey: "menuMusic")
        
        var fadeIn = SKAction.fadeInWithDuration(1.5)
        var fadeOut = SKAction.fadeOutWithDuration(1.5)
        
        img_goAgain.runAction(fadeIn)
        img_copOut.runAction(fadeIn)
        icon_twitter.runAction(fadeIn)
        
        var score = SKLabelNode(fontNamed: "Arial")
        score.text = "Score: " + String(finalScore);
        score.fontSize = 30;
        score.position = CGPointMake(self.size.width/2, 250);
        score.zPosition = CGFloat(0.6)
        score.alpha = 0
        
        self.addChild(score)
        score.runAction(fadeIn)
        
    }
    
    
    
    override func update(currentTime: CFTimeInterval) {
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let nodeTouch = nodeAtPoint(location)
            
            if(nodeTouch == img_goAgain){
                runAction(sound_flip1)
                removeActionForKey("menuMusic")
                self.view?.presentScene(Pop(size: self.scene!.size, choice: userChoice), transition: SKTransition.flipHorizontalWithDuration(0.5))
                
            }
                
            else if(nodeTouch == img_copOut){
                runAction(sound_flip1)
                removeActionForKey("menuMusic")
                self.view?.presentScene(MainMenu(size: self.scene!.size), transition: SKTransition.flipHorizontalWithDuration(0.5))
                
            }
                
            else if(nodeTouch == icon_twitter){
                NSNotificationCenter.defaultCenter().postNotificationName("tweetNotify", object: nil)
            }
            
        }
        
    }
    
    
}
