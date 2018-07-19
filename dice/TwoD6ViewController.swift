//
//  ViewController.swift
//  dice
//
//  Created by Scott Pastor on 10/7/17.
//  Copyright © 2017 Scott Pastor All rights reserved.
//  Open source 6 sided dice clip art from: http://clipart-library.com/clipart/8iGEd8dgT.htm
//  Open source 4 sided dice clip art from: http://game-icons.net/tags/dice.html
//  Open source dice rolling sound effect from: http://soundbible.com/182-Shake-And-Roll-Dice.html


import UIKit
import AVFoundation



class TwoD6ViewController: UIViewController {
    
    
    var soundEffect: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var diceImage: UIImageView!
    @IBOutlet weak var diceImage2: UIImageView!
    
    var result = 0

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func button(_ sender: Any) {
        setRoll()
        animateDice()
        animateDice2()

    }
    
    
    @IBAction func externalLink(_ sender: Any) {
        /*
        let app = UIApplication.shared
        let urlAddress = "https://www.linkedin.com/in/scottpastor"
        let urlw = URL(string:urlAddress)
        app.openURL(urlw!)
        */
    }
    func getRoll(number:Int) -> Roll {
        return diceArray[number]
    }
    
    func animateDice() {
        //Plays Sound
        soundEffect.currentTime = 0
        soundEffect.play()
        //Animates Dice Roll
        let transform = diceImage.transform
        let rotated = transform.rotated(by: CGFloat.pi / 4.0)
        UIView.animate(withDuration: 0.1) {
            self.diceImage.transform = rotated
        }
    }
    func animateDice2() {
        //Plays Sound
        soundEffect.currentTime = 0
        soundEffect.play()
        //Animates Dice Roll
        let transform = diceImage2.transform
        let rotated = transform.rotated(by: CGFloat.pi / -4.0)
        UIView.animate(withDuration: 0.1) {
            self.diceImage2.transform = rotated
        }
    }
    
    func setRoll() {
        result = 0
        let d1 = getRoll()
        let d2 = getRoll()
        if (result == 8 || result == 11) {
            resultLabel.text = "You rolled an \(result)"
        } else {
            resultLabel.text = "You rolled a \(result)"
        }
        view.backgroundColor = d1.backgroundColor
        diceImage.image = d1.image
        diceImage2.image = d2.image

    }
    func setRoll2() {
        let d1 = getRoll()
        diceImage2.image = d1.image
    }
    
    var diceArray = [Roll]()

    
    func InitilizeArray() {
        // initialize an object of type Roll
        let d1 = Roll(pipCount: "1")
        d1.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1)
        d1.image = UIImage(named:  "d6-1.png")!
        diceArray.append(d1)
        
        let d2 = Roll(pipCount: "2")
        d2.backgroundColor = UIColor(red: 180/255, green: 0/255, blue: 0/255, alpha: 1)
        d2.image = UIImage(named:"d6-2.png")!
        diceArray.append(d2)
        
        let d3 = Roll(pipCount: "3")
        d3.backgroundColor = UIColor(red: 120/255, green: 0/255, blue: 0/255, alpha: 1)
        d3.image = UIImage(named:"d6-3.png")
        diceArray.append(d3)
        
        let d4 = Roll(pipCount: "4")
        d4.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 0/255, alpha: 1)
        d4.image = UIImage(named:"d6-4.png")
        diceArray.append(d4)
        
        let d5 = Roll(pipCount: "5")
        d5.backgroundColor = UIColor(red: 0/255, green: 180/255, blue: 0/255, alpha: 1)
        d5.image = UIImage(named:"d6-5.png")
        diceArray.append(d5)
        
        let d6 = Roll(pipCount: "6")
        d6.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1)
        d6.image = UIImage(named:"d6-6.png")
        diceArray.append(d6)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InitilizeArray()
        //InitilizeArray2()

        setRoll()

        let soundFile = Bundle.main.path(forResource: "rollSound", ofType: ".mp3")
        do {
            try soundEffect = AVAudioPlayer(contentsOf: URL(fileURLWithPath:soundFile!))
        }
        catch {
            print(error)
        }
    }
    
    
    func getRoll() -> Roll {
        var randomNumber = 0
        randomNumber = Int(arc4random_uniform(UInt32(diceArray.count)))
        result += (randomNumber + 1)
        return  getRoll(number:randomNumber)
    }
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        setRoll()
        animateDice()
        animateDice2()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //https://api.myjson.com/bins/i0kfn
    
    
}

