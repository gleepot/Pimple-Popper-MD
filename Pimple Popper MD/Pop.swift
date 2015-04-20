//
//  Homebody.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/16/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import SpriteKit

class Pop: SKScene {
    
    var userChoice = 0
    
    init(size: CGSize, choice: Int){
        super.init(size:size)
        userChoice = choice
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var score:SKLabelNode!
    var gameTime:SKLabelNode!
    
    // zit sprite setups
    
    var zitCount = 10
    var zitScore = 0
    var zitNumber = 0
    
    var gameTimer = 30
    
    var zitTimer1 = 1.0
    var zitTimer2 = 1.15
    var zitTimer3 = 1.25
    var zitTimer4 = 1.35
    var zitTimer5 = 1.5
    
    var zitNormal1 = SKTexture(imageNamed: "zitNormal2.png")
    var zitNormal2 = SKTexture(imageNamed: "zitNormal3.png")
    var zitNormal3 = SKSpriteNode(imageNamed: "zitNormal3.png")
    
    var zitPop1 = SKSpriteNode(imageNamed: "zitNormal_popped1.png")
    
    var zitNormal_touch = SKSpriteNode(imageNamed: "zitNormal_touch.png")
    var zitNormal_pop1 = SKTexture(imageNamed: "zitNormal_popped1.png")
    var zitNormal_pop2 = SKTexture(imageNamed: "zitNormal_popped2.png")
    var zitNormal_pop3 = SKSpriteNode(imageNamed: "zitNormal_popped3.png")
    var zitNormal_pop4 = SKSpriteNode(imageNamed: "zitNormal_popped4.png")
    
    var sound_zitForm = SKAction.playSoundFileNamed("form2.wav", waitForCompletion: false)
    var sound_zitPop = SKAction.playSoundFileNamed("pop1.wav", waitForCompletion: false)
    
    var gameMusic = SKAction.playSoundFileNamed("music_main.wav", waitForCompletion: true)
    
    var face_guy1 = SKSpriteNode(imageNamed: "face_guy1.png")
    var face_guy2 = SKSpriteNode(imageNamed: "face_guy2.png")
    var face_guy3 = SKSpriteNode(imageNamed: "face_guy3.png")
    var face_girl1 = SKSpriteNode(imageNamed: "face_girl1.png")
    
    override func didMoveToView(view: SKView) {
        
        var gamePlayWait = SKAction.waitForDuration(30)
        var gamePlay = SKAction.runBlock{
            
            self.runAction(self.gameMusic)
            
            
            if(self.userChoice == 1){
                self.face_guy1.position = CGPointMake(self.size.width/2, self.size.height/2)
                self.face_guy1.zPosition = CGFloat(0.2)
                self.addChild(self.face_guy1)
            }
                
            else if(self.userChoice == 2){
                self.face_guy2.position = CGPointMake(self.size.width/2, self.size.height/2)
                self.face_guy2.zPosition = CGFloat(0.2)
                self.addChild(self.face_guy2)
            }
                
            else if(self.userChoice == 3){
                self.face_girl1.position = CGPointMake(self.size.width/2, self.size.height/2)
                self.face_girl1.zPosition = CGFloat(0.2)
                self.addChild(self.face_girl1)
            }
                
            else if(self.userChoice == 4){
                self.face_guy3.position = CGPointMake(self.size.width/2, self.size.height/2)
                self.face_guy3.zPosition = CGFloat(0.2)
                self.addChild(self.face_guy3)
            }
            
            self.score = SKLabelNode(fontNamed: "Arial")
            self.score.text = "Score: " + String(self.zitScore);
            self.score.fontSize = 24;
            self.score.position = CGPointMake(self.size.width/2, 24);
            self.score.zPosition = CGFloat(0.3)
            
            self.addChild(self.score)
            
            self.gameTime = SKLabelNode(fontNamed: "Arial")
            self.gameTime.text = "Time: " + String(self.gameTimer);
            self.gameTime.fontSize = 24;
            self.gameTime.position = CGPointMake(260, 455);
            self.gameTime.zPosition = CGFloat(0.4)
            
            self.addChild(self.gameTime)
            
            self.runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(self.spawnZit),SKAction.waitForDuration(self.zitTimer1)])), withKey: "zitPlay")
            
            var wait = SKAction.waitForDuration(1)
            var run = SKAction.runBlock {
                self.gameTimer -= 1
                self.gameTime.text = "Time: " + String(self.gameTimer);
            }
            
            self.runAction(SKAction.repeatActionForever(SKAction.sequence([wait, run])))
        }
        
        var restartGame = SKAction.runBlock{
            self.view?.presentScene(Results(size: self.scene!.size, score: zitScore, choice: self.userChoice), transition: SKTransition.flipHorizontalWithDuration(0.5))
        }
        
        runAction(SKAction.sequence([gamePlay, gamePlayWait, restartGame]))
        
    }
    
    func spawnZit(){
        
        let zit = SKSpriteNode(imageNamed: "zitNormal2.png")
        zit.position = CGPointMake(randomX(240) + 40, randomY(350) + 50)
        zit.zPosition = CGFloat(1.3)
        zit.name = "zit" + String(zitNumber)
        zitNumber+=1
        
        var zitForm1 = SKAction.runBlock{
            zit.texture = self.zitNormal1
            self.addChild(zit)
        }
        
        var zitFormWait = SKAction.waitForDuration(0.10)
        
        var zitForm2 = SKAction.runBlock{
            zit.texture = self.zitNormal2
        }
        
        
        runAction(SKAction.sequence([zitForm1, zitFormWait, zitForm2]))
        runAction(sound_zitForm)
        
        let zitDelay = SKAction.waitForDuration(NSTimeInterval(randomWait(2.0) + 0.55))
        
        let remove = SKAction.removeFromParent()
        
        zit.runAction(SKAction.sequence([zitDelay, remove]))
    }
    
    func extraZitSpawn(){
        if (zitCount == 5){
            runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(spawnZit),SKAction.waitForDuration(zitTimer2)
                ])
                ))
        }
            
        else if (zitCount == 10){
            runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(spawnZit),SKAction.waitForDuration(zitTimer3)
                ])
                ))
        }
            
        else if (zitCount == 20){
            runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(spawnZit),SKAction.waitForDuration(zitTimer4)
                ])
                ))
        }
            
        else if (zitCount >= 50){
            runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(spawnZit),SKAction.waitForDuration(zitTimer5)
                ])
                ))
        }
    }
    
    func randomY(height: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) % CGFloat(height)
    }
    
    func randomX(width: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) % CGFloat(width)
    }
    
    func randomWait(wait: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) % CGFloat(wait)
    }
    
    override func update(currentTime: CFTimeInterval) {
        
        if (gameTimer <= 0){
            
        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            let nodeTouch = nodeAtPoint(location)
            
            if(nodeTouch == face_guy1){
                
            }
                
            else if(nodeTouch == gameTime){
                
            }
                
            else if(nodeTouch == face_guy2){
                
            }
                
            else if(nodeTouch == face_guy3){
                
            }
                
            else if(nodeTouch == face_girl1){
                
            }
                
            else if(nodeTouch == score){
                
            }
                
            else if(nodeTouch == zitPop1){
                
            }
            else{
                zitPop1.position = location
                zitPop1.zPosition = (1.5)
                
                var zitPopAnimation1 = SKAction.runBlock{
                    self.zitPop1.texture = self.zitNormal_pop1
                    self.addChild(self.zitPop1)
                }
                
                var zitFormWait = SKAction.waitForDuration(0.10)
                
                var zitPopAnimation2 = SKAction.runBlock{
                    self.zitPop1.texture = self.zitNormal_pop2
                }
                
                var zitPopRemove = SKAction.runBlock{
                    self.zitPop1.removeFromParent()
                }
                
                runAction(SKAction.sequence([zitPopAnimation1, zitFormWait, zitPopAnimation2, zitFormWait,  zitPopRemove]))
                runAction(sound_zitPop)
                
                nodeTouch.removeFromParent()
                
                extraZitSpawn()
                zitScore += 1
                zitCount += 1
                
                score.text = "Score: " + String(zitScore);
            }
        }
    }
    
    
}
