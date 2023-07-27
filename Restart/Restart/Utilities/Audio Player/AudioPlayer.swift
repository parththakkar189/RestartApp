//
//  AudioPlayer.swift
//  Restart
//
//  Created by Parth Thakkar on 2023-02-22.
//

import Foundation
import AVFoundation


var audioPlayer: AVAudioPlayer?

func actionPlaySound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        }catch{
            print("Could not play the sound file")
        }
    }
}
