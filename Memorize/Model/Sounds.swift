//
//  Sounds.swift
//  Memorize
//
//  Created by Augusto Galindo Alí on 20/02/21.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: "m4a") {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Couldn't find and play the sound file.")
        }
    }
}
