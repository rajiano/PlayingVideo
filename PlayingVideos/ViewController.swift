//
//  ViewController.swift
//  PlayingVideos
//
//  Created by Oludemilade Raji on 4/13/17.
//  Copyright © 2017 Personal. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class ViewController: UIViewController {
    
    var playerController = AVPlayerViewController()
    var player:AVPlayer?
    
    var streamPlayerController = AVPlayerViewController()
    var streamPlayer:AVPlayer?
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let embedCode = "<iframe width=\"1280\" height=\"720\" src=\"https://www.youtube.com/embed/vuMC83kP2VY\" frameborder=\"0\" allowfullscreen></iframe>"
        webView.loadHTMLString(embedCode, baseURL: nil)
        
        let videoString:String? = Bundle.main.path(forResource: "new_test", ofType: "mp4")
        
        if let url = videoString {
            let videoURL = NSURL(fileURLWithPath: url)
            self.player = AVPlayer(url: videoURL as URL)
            self.playerController.player = self.player
            
        }
        
        let streamVideoURL:NSURL? = NSURL(string: "http://techslides.com/demos/sample-videos/small.mp4")
        
        if let streamUrl = streamVideoURL {
            self.streamPlayer = AVPlayer(url: streamUrl as URL)
            self.streamPlayerController.player = self.streamPlayer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playVideo(_ sender: Any) {
        self.present (self.playerController, animated: true, completion: {
            self.playerController.player?.play();
        })
        
    }
    
    @IBAction func streamVideo(_ sender: Any) {
        self.present (self.streamPlayerController, animated: true, completion: {
            self.streamPlayerController.player?.play()
        })
        
    }

}

