//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var totalBill : Float?
    var percentage : Float = 0.0
    var splitNumber : Int?
    var tip : String?
    var calculatorBrain = CalculatorBrain()
    

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        sender.isSelected = true
        tip = sender.currentTitle!
        
        if(sender.currentTitle == "0%"){
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            percentage = 0.0
        }else if (sender.currentTitle == "10%"){
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
            percentage = 0.1
        }else{
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            percentage = 0.2
        }
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {

        splitNumberLabel.text = String(format: "%.f", sender.value)
        splitNumber = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        totalBill = (billTextField.text! as NSString).floatValue * (1 + percentage)
        performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult"){
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.billForEach = Float(totalBill!) / Float(splitNumber ?? 2)
            destinationVC.splitNum = splitNumber ?? 2
            destinationVC.tip = tip ?? "0%"
        }
    }
}

