
import Foundation
import UIKit
import AVFoundation

var sfxPlayer: AVAudioPlayer?
var bgmPlayer: AVAudioPlayer?

extension UIView {
    func playSfx(fileName: String, fileExtension: String) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: fileExtension)!)
        
        do {
            sfxPlayer = try AVAudioPlayer(contentsOf: url)
            sfxPlayer?.play()
            sfxPlayer?.volume = 2
        } catch {
            print("Could not find and play the sound file!")
        }
    }
    
    func playBgm(fileName: String, fileExtension: String) {
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: fileName, ofType: fileExtension)!)
        
        do {
            bgmPlayer = try AVAudioPlayer(contentsOf: url)
            bgmPlayer?.numberOfLoops = -1
            bgmPlayer?.volume = 0.5
            bgmPlayer?.play()
        } catch {
            print("Could not find and play the sound file!")
        }
    }
    
    func playFullBgm() {
        playBgm(fileName: "sunnyDay", fileExtension: "mp3")
    }
    
    func playButton() {
        playSfx(fileName: "button", fileExtension: "mp3")
    }

}
