//
//  playSound.swift
//  tonefelt
//
//  Created by Batjin Lamjav on 4/13/22.
//

import Foundation
import AVFoundation

var audioPlayer:AVAudioPlayer?

func playMusic(songName: String) {
    print("in playMusic()")
    print(songName)
    
    if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
        audioPlayer.pause()
    }
    else {
        do {
            let songUrl = Bundle.main.path(forResource: songName, ofType: "mp3")
            //print(songUrl)
            
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let songUrl = songUrl else {
                return
            }
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songUrl))
            
            guard let audioPlayer = audioPlayer else {
                return
            }
            
            audioPlayer.play()

        }
        catch
        {
            print("could not find or play the music file")
        }
        
    }
    
    /*if let songUrl = Bundle.main.path(forResource: songName, ofType: "mp3") {
        //print("in if statement")
        do {
            //print(songUrl)
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songUrl))
            audioPlayer?.play()
        }
        catch {
            print("could not find or play the music file")
        }
    }*/
}
