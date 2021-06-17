//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import  AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    var timer = Timer()
    var totalSeconds = 0
    var secondsPassed = 0
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    var player: AVAudioPlayer!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        progressBar.progress = 0.0
        
        let hardness = sender.currentTitle!
        totalSeconds = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func updateCounter() {
        //example functionality
        if secondsPassed < totalSeconds {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalSeconds)
            
        } else if secondsPassed == totalSeconds {
            timer.invalidate()
            messageLabel.text = "DONE!"
            playSound()
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
}
