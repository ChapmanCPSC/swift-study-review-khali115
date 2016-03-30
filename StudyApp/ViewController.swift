//
//  ViewController.swift
//  StudyApp
//
//  Created by Ani Khalili on 3/21/16.
//  Copyright © 2016 Ani Khalili. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var seconds = 30
    var timer = NSTimer()
    var gameStarted = false
    var timerRunning = false
    var gameOver = false
    
    @IBOutlet weak var conceptLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    
    var listOfConcepts:[String] = ["Let", "Var", "Computed Variable", "Computed Initializer",
                                    "Setter Observer", "Function", "External Parameter", "Default Parameter",
                                    "Anonymous Function", "Optional Chaining", "Failable Initializer", "Casting",
                                    "Class Method", "Extension", "Enumeration", "Error Handling", "Dictionary",
                                    "Conditional Binding", "Protocol", "Inheritance", "Struct", "Enum", "Class",
                                    "Subscript"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTimer(){
        
        if(seconds > 0){
            seconds--
          
            timerLabel.text = "\(seconds)"
        }
        else if seconds == 0{
            displayConcept()
            resetTimer()
        }
    
    }
    
    func resetTimer(){
        seconds = 30
        timerLabel.text = "\(seconds)"
        timer.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
    }
    
    @IBAction func startButton(sender: UIButton) {
        
        if gameStarted == false{
            controlButton.setTitle("Next", forState: UIControlState.Normal)
            gameStarted = true
        }
        
        if timerRunning == false{
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
            timerRunning = true
        }
        if gameOver == true{
            gameOver = false
            controlButton.setTitle("Next", forState: UIControlState.Normal)
            restartGame()
        }
        
        resetTimer()
        displayConcept()
    }
    
    func displayConcept(){
        
        if(listOfConcepts.count > 0){
            
            let rnd_idx = Int(arc4random_uniform(UInt32(listOfConcepts.count)))
            let val = listOfConcepts[rnd_idx]
            conceptLabel.text = "\(val)"
            listOfConcepts.removeAtIndex(rnd_idx)
        }
        else if listOfConcepts.count == 0{
            timer.invalidate()
            timerLabel.text = "---"
            conceptLabel.text = "Game Over"
            controlButton.setTitle("Restart", forState: UIControlState.Normal)
            timerRunning = false
            gameOver = true
        }
    }
    
    func restartGame(){
        //populating array
        listOfConcepts = ["Let", "Var", "Computed Variable", "Computed Initializer",
                        "Setter Observer", "Function", "External Parameter", "Default Parameter",
                        "Anonymous Function", "Optional Chaining", "Failable Initializer", "Casting",
                        "Class Method", "Extension", "Enumeration", "Error Handling", "Dictionary",
                        "Conditional Binding", "Protocol", "Inheritance", "Struct", "Enum", "Class",
                        "Subscript"]
        
        //controlButton.setTitle("Next", forState: UIControlState.Normal)

    }

}

