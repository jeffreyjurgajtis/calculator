//
//  ViewController.swift
//  Calculator
//
//  Created by Jeffrey Jurgajtis on 4/3/15.
//  Copyright (c) 2015 JeffreyJurgajtis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsTypingNumber: Bool = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        

        if userIsTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTypingNumber = true
        }
    }
}