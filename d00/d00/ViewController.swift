//
//  ViewController.swift
//  d00
//
//  Created by Mykola ZHURBA on 9/30/19.
//  Copyright © 2019 mzhurba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Operation: Int {
        case nothing
        case add
        case sub
        case mul
        case div
        
        func doOperation(a: Int, b: Int) -> Int {
            if (self.rawValue == 1) {
                if (a + b > 2147483647) {
                    return 2147483647
                }
                else if (a + b < -2147483648) {
                    return (-2147483648)
                }
                else {
                    return a + b
                }
            }
            else if (self.rawValue == 2) {
                if (a - b > 2147483647) {
                    return 2147483647
                }
                else if (a - b < -2147483648) {
                    return (-2147483648)
                }
                else {
                    return a - b
                }
            }
            else if (self.rawValue == 3) {
                if (a * b > 2147483647) {
                    return 2147483647
                }
                else if (a * b < -2147483648) {
                    return (-2147483648)
                }
                else {
                    return a * b
                }
            }
            else if (self.rawValue == 4) {
                if (b == 0) {
                    return a < 0 ? -2147483648 : 2147483647
                }
                else {
                    return Int(round(Double(a) / Double(b)))
                }
            }
            else {
                return a
            }
        }
    }

    @IBOutlet weak var outputLbl: UILabel!
    var lastOperation = Operation.nothing
    var leftOperand = 0
    var rightOperand = 0
    var wasOperation = false
    var rightOperandWasUpdated = false
    var leftOperandWasUpdated = false
    var resultWasCalculated = false

    @IBAction func negBtn(_ sender: UIButton) {
        print("NEG")
        if (!rightOperandWasUpdated || resultWasCalculated) {
            leftOperand *= -1
            if (leftOperand > 2147483647) {
                leftOperand = 2147483647
            }
            outputLbl.text = String(leftOperand)
        }
        else {
            rightOperand *= -1
            if (rightOperand > 2147483647) {
                rightOperand = 2147483647
            }
            outputLbl.text = String(rightOperand)
        }
    }
    
    @IBAction func operationBtn(_ sender: UIButton) {
        print(sender.currentTitle!)
        if (wasOperation && rightOperandWasUpdated && !resultWasCalculated) {
            resultWasCalculated = false
            leftOperand = lastOperation.doOperation(a: leftOperand, b: rightOperand)
            outputLbl.text = String(leftOperand)
        }
        wasOperation = true
        rightOperandWasUpdated = false
        resultWasCalculated = false
        if (sender.currentTitle! == "×") {
            lastOperation = Operation.mul
        }
        else if (sender.currentTitle! == "÷") {
            lastOperation = Operation.div
        }
        else if (sender.currentTitle! == "-") {
            lastOperation = Operation.sub
        }
        else if (sender.currentTitle! == "+") {
            lastOperation = Operation.add
        }
    }

    @IBAction func numberBtn(_ sender: UIButton) {
        print(sender.currentTitle!)
        if (!wasOperation || resultWasCalculated)
        {
            if (!leftOperandWasUpdated) {
                leftOperandWasUpdated = true
                leftOperand = 0
            }
            if (!(leftOperand == 0 && sender.currentTitle! == "0")) {
                if (leftOperand >= 0)
                {
                    if (leftOperand * 10 + Int(sender.currentTitle!)! <= 2147483647) {
                        leftOperand = leftOperand * 10 + Int(sender.currentTitle!)!
                        outputLbl.text = String(leftOperand)
                    }
                }
                else {
                    if (leftOperand * 10 - Int(sender.currentTitle!)! >= -2147483648) {
                        leftOperand = leftOperand * 10 - Int(sender.currentTitle!)!
                        outputLbl.text = String(leftOperand)
                    }
                }
            }
        }
        else {
            if (!rightOperandWasUpdated) {
                rightOperandWasUpdated = true
                rightOperand = Int(sender.currentTitle!)!
                outputLbl.text = String(rightOperand)
            }
            else if (!(rightOperand == 0 && sender.currentTitle! == "0")) {
                if (rightOperand >= 0)
                {
                    if (rightOperand * 10 + Int(sender.currentTitle!)! <= 2147483647) {
                        rightOperand = rightOperand * 10 + Int(sender.currentTitle!)!
                        outputLbl.text = String(rightOperand)
                    }
                }
                else {
                    if (rightOperand * 10 - Int(sender.currentTitle!)! >= -2147483648) {
                        rightOperand = rightOperand * 10 - Int(sender.currentTitle!)!
                        outputLbl.text = String(rightOperand)
                    }
                }
            }
        }
    }
    
    @IBAction func resBtn(_ sender: UIButton) {
        print("=")
        if (wasOperation) {
            if (!rightOperandWasUpdated) {
                rightOperand = leftOperand
                rightOperandWasUpdated = true
            }
            leftOperandWasUpdated = false
            resultWasCalculated = true
            leftOperand = lastOperation.doOperation(a: leftOperand, b: rightOperand)
            outputLbl.text = String(leftOperand)
        }
    }
    
    @IBAction func clearBtn(_ sender: UIButton) {
        print("AC")
        lastOperation = Operation.nothing
        leftOperand = 0
        rightOperand = 0
        wasOperation = false
        rightOperandWasUpdated = false
        leftOperandWasUpdated = false
        resultWasCalculated = false
        outputLbl.text = String(leftOperand)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
