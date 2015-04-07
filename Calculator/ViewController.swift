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
    
    var userIsTypingNumber = false

    var engine = CalculatorEngine()

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if userIsTypingNumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTypingNumber = true
        }
    }

    @IBAction func operate(sender: UIButton) {
        if userIsTypingNumber {
            enter()
        }
        if let operation = sender.currentTitle {
            if let result = engine.performOperation(operation) {
                displayValue = result
            } else {
                displayValue = 0
            }
        }
    }

    @IBAction func enter() {
        userIsTypingNumber = false
        if let result = engine.pushOperand(displayValue) {
            displayValue = result
        } else {
            displayValue = 0
        }
    }

    var displayValue: Double {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTypingNumber = false
        }
    }
}