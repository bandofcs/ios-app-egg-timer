//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player:AVAudioPlayer!
    let eggTime=["Soft":5,"Medium":7,"Hard":12]
    var timer=Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress=0.0
        let hardness=sender.currentTitle
        var secondsRemaining = eggTime[hardness!]!
        titleLabel.text=hardness
        timer.invalidate()
        timer=Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] (timer) in
                if secondsRemaining > 0 {
                    secondsRemaining -= 1
                    progressBar.progress=1.0-Float(secondsRemaining)/Float(eggTime[hardness!]!)
                    print ("\(secondsRemaining) seconds.")
                    
                } else {
                    timer.invalidate()
                    titleLabel.text="Done!"
                    playSound()
                }
        }
        
    }
    
    func playSound() {
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        }

}
