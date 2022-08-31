//
//  ViewController.swift
//  Tipsy
//
//  Created by Dmitry M. on 7/15/22.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var totalBill: UITextField!
    @IBOutlet weak var peopleCount: UILabel!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenTip: UIButton!
    @IBOutlet weak var twentyTip: UIButton!
    
    var calculatorBrain = CalculatorBrain()
    var tipCount = Double(0.0)
    var billTotal = 0.0
    var numberOfPeople = 2
    var tpp = "0.0"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Dismissing the keybord method, when tipSelected button is pressed (called by dismissKeybord func, and it also work without this function [only with let tap = UITapGestureRecognizer in viewDidLoad()], but when you press anywhere on the screen). Keybord is activating when we print smth in totalBill field
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func chooseSplit(_ sender: UIStepper) {
        peopleCount.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        let tipChoice = sender.currentTitle!
        
        // Dismissing the keybord method, when tipSelected button is pressed (called by dismissKeybord func, and it also work without this function [only with let tap = UITapGestureRecognizer in viewDidLoad()], but when you press anywhere on the screen). Keybord is activating when we print smth in totalBill field
        totalBill.endEditing(true)
        
        zeroTip.isSelected = calculatorBrain.zeroColorChanged(tipChoice: tipChoice)
        tenTip.isSelected = calculatorBrain.tenColorChanged(tipChoice: tipChoice)
        twentyTip.isSelected = calculatorBrain.twentyColorChanged(tipChoice: tipChoice)
        }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let zero = zeroTip.isSelected
        let ten = tenTip.isSelected
        let twenty = twentyTip.isSelected
        tipCount = calculatorBrain.tipCountValue(zero: zero, ten:ten, twenty: twenty)
        let bill = totalBill.text!
        if bill != "" {
            billTotal = Double(bill) ?? 0
            let result = billTotal * (1 + tipCount) / Double(numberOfPeople)
            tpp = String(format: "%.2f", result)
        }
        if bill == String() {
            tpp = "go back and print correct bill cost"
        }
        print(tipCount)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tpp = tpp
            destinationVC.message = calculatorBrain.messagePeople(numberOfPeople: numberOfPeople, tipCount: tipCount)
        }
    }
    
}

