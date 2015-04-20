//
//  GameViewController.swift
//  PPMD_1
//
//  Created by Grant Potter on 4/16/15.
//  Copyright (c) 2015 Homebodies. All rights reserved.
//

import UIKit
import SpriteKit
import Social


extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
    func showTweetSheet() {
        let tweetSheet = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        tweetSheet.completionHandler = {
            result in
            switch result {
            case SLComposeViewControllerResult.Cancelled:
                break
                
            case SLComposeViewControllerResult.Done:
                
                break
            }
        }
        
        tweetSheet.setInitialText("I just popped some zits in Pimple Popper MD!")
        
        self.presentViewController(tweetSheet, animated: false, completion: {
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showTweetSheet", name: "tweetNotify", object: nil)
        
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            
            let skView = self.view as! SKView
            
            
            skView.ignoresSiblingOrder = true
            
            
            scene.size = skView.bounds.size
            scene.scaleMode = SKSceneScaleMode.AspectFill
            
            skView.presentScene(scene)
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
