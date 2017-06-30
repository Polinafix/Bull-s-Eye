//
//  ViewController.swift
//  BullsEye
//
//  Created by Polina Fiksson on 25/06/2017.
//  Copyright © 2017 PolinaFiksson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
        updateLabels()
       
    }
    
    func startNewRound(){
        currentValue = 50
        slider.value = Float(currentValue)
        //generating a random Number in the range from 1 to 100
        targetValue = 1 + Int(arc4random_uniform(100))
        
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
    }

   
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        let points = 100 - difference
        score += points
        let message = " You scored \(points) points"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
        updateLabels()
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        //use the function lroundf() to round the decimal number to the nearest whole
        //number
        currentValue = lroundf(sender.value)
    }
    


}

