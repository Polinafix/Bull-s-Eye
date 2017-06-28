//
//  ViewController.swift
//  BullsEye
//
//  Created by Polina Fiksson on 25/06/2017.
//  Copyright © 2017 PolinaFiksson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue:Int = 0
    var targetValue:Int = 0
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        currentValue = lroundf(slider.value)
        //generating a random Number in the range from 1 to 100
        targetValue = 1 + Int(arc4random_uniform(100))
    }

   
    
    @IBAction func showAlert() {
        
        let message = "The value of the slider is: \(currentValue)" +
        "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title: "Hello, World",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default,
                                   handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        //use the function lroundf() to round the decimal number to the nearest whole
        //number
        currentValue = lroundf(sender.value)
    }
    


}

