//
//  ViewController.swift
//  HWS_Project_2
//
//  Created by Travis Chapman on 7/11/16.
//  Copyright © 2016 Travis Chapman. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var countries = [
        "estonia",
        "france",
        "germany",
        "ireland",
        "italy",
        "nigeria",
        "poland",
        "russia",
        "spain",
        "uk",
        "us"
    ]
    var correctAnswerIndex = 0, // the index 0-2 in countries array with the correct answer
        score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        askQuestion()
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjectsInArray(countries) as! [String]
        
        button1.setImage(UIImage(named: countries[0]), forState: .Normal)
        button2.setImage(UIImage(named: countries[1]), forState: .Normal)
        button3.setImage(UIImage(named: countries[2]), forState: .Normal)
        
        correctAnswerIndex = GKRandomSource().nextIntWithUpperBound(3)
        
        self.title = countries[correctAnswerIndex].uppercaseString
        
        scoreLabel.text = "Score: \(score)"
    
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswerIndex {
            title = "Correct!"
            score += 1
        } else {
            title = "Wrong"
            score = 0
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .Alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .Default, handler: askQuestion))
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

