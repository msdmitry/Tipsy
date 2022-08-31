//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Dmitry M. on 7/15/22.
//

import Foundation

struct CalculatorBrain {
    
    var tipCount: Double?
    
    mutating func zeroColorChanged(tipChoice: String) -> Bool {
        if tipChoice == "0%" {
            return true
        } else {
            return false
        }
    }
           
        mutating func tenColorChanged(tipChoice: String) -> Bool {
            if tipChoice == "10%" {
                return true
            } else {
                return false
            }
        }
            
            mutating func twentyColorChanged(tipChoice: String) -> Bool {
                if tipChoice == "20%" {
                    return true
                } else {
                    return false
                }
            }
    
    mutating func tipCountValue(zero: Bool, ten: Bool, twenty: Bool) -> Double! {
        if zero == true {
            tipCount = 0.0
        } else if ten == true {
            tipCount = 0.10
        } else if twenty == true {
            tipCount = 0.20
        } else {
            tipCount = 0.0 }
        return tipCount
        }
    
    mutating func messagePeople(numberOfPeople: Int, tipCount: Double) -> String {
        let currentMessage = "Split between \(numberOfPeople) people, with \(tipCount*100)% tip."
        return currentMessage
    }

}
