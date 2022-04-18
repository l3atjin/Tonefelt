//
//  playSound.swift
//  tonefelt
//
//  Created by Batjin Lamjav on 4/13/22.
//

import Foundation
import AVFoundation
import LofeltHaptics
import UIKit

var audioPlayer:AVAudioPlayer?
var haptics: LofeltHaptics?

func loadHapticData(fileName: String) -> Data {
    let hapticData = NSDataAsset(name: fileName)
    return hapticData!.data
}

func playMusic(songName: String) {
    print("in playMusic()")
    print(songName)
    
    if let audioPlayer = audioPlayer, audioPlayer.isPlaying {
        audioPlayer.pause()
        try? haptics?.stop()
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
            //let audioData = NSDataAsset(name: "Stroke_1-audio")
            //audioPlayer = try? AVAudioPlayer(data: audioData!.data)
            
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: songUrl))
            
            haptics = try? LofeltHaptics.init()
            
            //let audioData = NSDataAsset(name: "Stroke_1-audio")
            //audioPlayer = try! AVAudioPlayer(data: audioData!.data)
            
            // load haptic clip
            let hapticName = songName + "_haptic"
            print(hapticName)
            print("Give Life Back To Music_haptic")
            print(hapticName.count)
            print("Give Life Back To Music_haptic".count)
            try? haptics?.load(from: loadHapticData(fileName: hapticName))
            
            // play audio and haptic clip
            audioPlayer?.play()
            try? haptics?.play()
           
            
            

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
