//
//  ViewController.swift
//  Xylophone
//
//  Created by Byrron Doss on 10/01/2018.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    var selectedSoundFileName : String = ""
    
    // we're going to create an array that has the sound files for each xylophone button right now
    // because this data will not change, meaning it's a constant, we'll use the let operator to let swift and future programmers know what this variable is
    
    let soundArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"]


    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        // now that we have the sound playing functionality, we need a way to make each button play it's own sound. one way of doing this is using each buttons "tag" number to be matched to the wanted sound file
        
        // because we already created a global selectedSoundFileName variable, we can just change the value of it locally here when the button is pressed
        
        selectedSoundFileName = soundArray[sender.tag - 1]
        
        // this variable expects the data to be a string type. then that string will be equal to our entire array. then we select, or index, that array by the sender.tag, meaning the button that was pressed on the main storyboard screen by the user
        
        // note: because arrays start at "0", even though the first item in our soundArray says "note1", that Swift will not be able to play the last note number 7 because that would technically be index number 6
        
        // this is an array index out of range error. a common thing, but we fixed this by subtracting 1 in the sender.tag method. that allows us to keep our buttons with their unique tags, and still have them match up with the right note number from our soundArray list
        
        playSound()
        
        
        
        }
        
    
    func playSound() {
        
        // now we're creating a link between when a UI button is pressed and the sound that is played
        // the sound being played needs to be named with the proper extension, e.g., .wav or .mp3
        // soundURL sets up the location of where our sound is
        
        let soundURL = Bundle.main.url(forResource: selectedSoundFileName, withExtension: "wav")
        
        // now our audio player will try to play a sound located at the URL location
        
        // in the forResource, we would like to add the selectedSoundFileName because that variable allows the proper note to play that is supposed to match the UI button's tag number
        
        // But we can't because it's made inside of the other function, and in a way "locked in" to that IBAction. That's what scope is.
        
        
        do {
            
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            
        }
        catch {
            
            print(error)
            
        }
        
        audioPlayer.play()
        
        // we originally had all the playSound functionality under IBaction, but that doesn't allow us to call playSound anywhere else. now that playSound is it's own function, we can call it inside of notePressed or anywhere else that delights us
        
    }
  

}

