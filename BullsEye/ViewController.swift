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
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 1
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        updateLabels()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
       
    }
    
    func startNewRound(){
        currentValue = 50
        roundLabel.text = "1"
        slider.value = Float(currentValue)
        //generating a random Number in the range from 1 to 100
        targetValue = 1 + Int(arc4random_uniform(100))
        
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }

   
    
    @IBAction func showAlert() {
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        
        
        round += 1
        
        let message = " You scored \(points) points"
        
        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        //handler tells the alert what should happen when the button is pressed
        
        let action = UIAlertAction(title: "OK", style: .default,
                                   handler: {action in
                                    self.startNewRound()
                                    self.updateLabels()})
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
       
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        //use the function lroundf() to round the decimal number to the nearest whole
        //number
        currentValue = lroundf(sender.value)
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        startNewGame()
        updateLabels()
    }
    func startNewGame(){
        score = 0
        round  = 1
        startNewRound()
    }


}

