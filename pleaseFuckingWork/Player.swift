import AVFoundation

class Player {
    
    var sounds = ["One.mp3", "Two"]
    
    init() {
        
    }
    
    func playRandomSound() {
        //player
        sounds.randomElement()!
    }
    
}
