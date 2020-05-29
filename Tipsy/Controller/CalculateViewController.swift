//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip : Float?
    var numOfPeople : Int?
    
    var calculatorBrain = CaclculatorBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        switch sender.title(for: .normal){
        case "0%":
            zeroPctButton.isSelected = true
            tip = 0.0
        case "10%":
            tenPctButton.isSelected = true
            tip = 0.1
        default:
            twentyPctButton.isSelected = true
            tip = 0.2
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let total = Float(billTextField.text ?? "0.0")!
        calculatorBrain.calculateSplitAmount(tip: (tip ?? 0.0), total: total, numOfPeople: (numOfPeople ?? 1)!)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        billTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultsViewController
        destinationVC.tip = calculatorBrain.getTip()
        destinationVC.splitAmount = calculatorBrain.getSplitAmount()
        destinationVC.numOfPeople = calculatorBrain.getNumOfPeople()
    }
    
}

