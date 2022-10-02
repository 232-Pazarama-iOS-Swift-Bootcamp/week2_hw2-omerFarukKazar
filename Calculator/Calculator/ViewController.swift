//
//  ViewController.swift
//  Calculator
//
//  Created by Ömer Faruk Kazar on 2.10.2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lastResultLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result: Double = 0
    var memory: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func calculate() { // resultLabel elements are seperated. Then necessary operation done by the type of operand.
        var resultArray = resultLabel.text!.components(separatedBy: " ")
        lastResultLabel.text! = resultLabel.text!
        guard let firstNumber = Double(resultArray[0]) else { return }
        guard let secondNumber = Double(resultArray[2]) else { return }
        switch resultArray[1] {
        case "%":
            result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
        case "+":
            result = firstNumber + secondNumber
        case "*":
            result = firstNumber * secondNumber
        case "-":
            result = firstNumber - secondNumber
        case "÷":
            result = firstNumber / secondNumber
        default:
            result = 0
        }
        resultLabel.text! = String(result)
    }
    
    // MARK: - Number Button Definitions
    @IBAction func numberButtonTapped(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
        if resultLabel.text! == "0" {
            resultLabel.text! = ""
        }
        resultLabel.text!.append(sender.titleLabel?.text ?? "")
    }
    
    // MARK: - Operand Button Definitions
    @IBAction func AllClearButtonTapped(_ sender: UIButton) {
        resultLabel.text! = ""
    }
    @IBAction func backspaceButtonTapped(_ sender: UIButton) {
        resultLabel.text!.removeLast()
    }
    @IBAction func percentageButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(" % ")
    }
    @IBAction func divideButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(" ÷ ")
    }
    @IBAction func multiplyButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(" * ")
    }
    @IBAction func minusButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(" - ")
    }
    @IBAction func plusButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(" + ")
    }
    @IBAction func dotButtonTapped(_ sender: UIButton) {
        resultLabel.text!.append(".")
    }
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        calculate()
    }
    
    // MARK: - Scientific Button Definitions
    @IBAction func mrButtonTapped(_ sender: UIButton) {
        var sumOfMemoryNumbers: Double = 0
        for i in 0..<memory.count {
            sumOfMemoryNumbers += memory[i]
        }
        resultLabel.text! = String(sumOfMemoryNumbers)
    }
    
    @IBAction func mMinusButtonTapped(_ sender: UIButton) {
        memory.append(-result)
    }
    @IBAction func mPlusButtonTapped(_ sender: UIButton) {
        memory.append(result)
    }
    @IBAction func mcButtonTapped(_ sender: UIButton) {
        memory.removeAll()
    }
    
    

}

