import Foundation
import AVFAudio
import UIKit
import AudioToolbox
import AVFoundation


extension UIDevice {
    static func vibrate() {
        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    }
}

struct MakeVibration{
   
    public func makeVibration(){
        if UserDefaults.standard.bool(forKey: "vibrations"){
            UIDevice.vibrate()
        }else{
            return
        }
    }
    
    public func playSound(){
 
     
        
     }
    
}


