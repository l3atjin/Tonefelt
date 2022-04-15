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
            
            /*guard let audioPlayer = audioPlayer else {
                return
            }*/
            
            //print(haptics?.getClipDuration())

            // Play audio and haptics (audio must be played first).
            
            //try? haptics?.play()
            
            
            /*let haptics = try? LofeltHaptics.init()

            // Fetch a Haptic Clip from the asset catalog.
            let hapticClip = NSDataAsset(name: "Stroke_1.haptic")

            // Load its data into an NSString.
            let hapticData = NSString(data: hapticClip!.data , encoding: String.Encoding.utf8.rawValue)

            // Load it into the LofeltHaptics object as a String.
            try? haptics?.load(hapticData! as String)

            // Play audio and haptics (audio must be played first).
            
            print(haptics?.getClipDuration())
            // Load it into the LofeltHaptics object as a String.
            audioPlayer.play()
            do {
                try haptics?.play()
            }
            catch {
                print("haptic error")
            }*/
            haptics = try? LofeltHaptics.init()
            
            //let audioData = NSDataAsset(name: "Stroke_1-audio")
            //audioPlayer = try! AVAudioPlayer(data: audioData!.data)
            
            // load haptic clip
            try? haptics?.load(from: loadHapticData(fileName: "zeze_haptic"))
            
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
