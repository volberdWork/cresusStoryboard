import Foundation
import AVFAudio

// MARK: - User Progress Data

struct UserProgressData {
    static var gameLevel: Int {
        get {
            return UserDefaults.standard.integer(forKey: "gameLevel")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "gameLevel")
        }
    }
    
    static var keyCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: "winCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "winCount")
        }
    }
    
    static var daysCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: "winCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "winCount")
        }
    }
    
    static var lossCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: "winCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "winCount")
        }
    }
    
    static var winCount: Int {
        get {
            return UserDefaults.standard.integer(forKey: "winCount")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "winCount")
        }
    }
    
    
}
    
 

//}
//
//// MARK: - Circle Dive Statistic
//
//struct CircleDiveStatistic {
//    static var winCount: Int {
//        get {
//            return UserDefaults.standard.integer(forKey: "winCount")
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "winCount")
//        }
//    }
//
//    static var lossCount: Int {
//        get {
//            return UserDefaults.standard.integer(forKey: "lossCount")
//        }
//        set {
//            UserDefaults.standard.set(newValue, forKey: "lossCount")
//        }
//    }
//}
