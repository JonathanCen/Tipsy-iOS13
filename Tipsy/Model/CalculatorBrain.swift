//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Jonathan Cen on 5/29/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CaclculatorBrain {
    
    var bill: Bill?
    
    mutating func calculateSplitAmount(tip: Float, total: Float, numOfPeople: Int) {
        let billTotal = (tip * total) + total
        let splitAmount = round((billTotal / Float(numOfPeople))*100)/100
        bill = Bill(numOfPeople: numOfPeople, tip: tip, total: total, billWithTip: billTotal, splitAmount: splitAmount)
    }
    
    func getSplitAmount() -> String {
        return String(format: "%.2f", (bill?.splitAmount ?? 0.0))
    }
    
    func getNumOfPeople() -> String {
        return String((bill?.numOfPeople ?? 1))
    }
    
    func getBill() -> String {
        return String(format: "%.2f", (bill?.total ?? 0.0))
    }
    
    func getTip() -> String {
        return String(format: "%.4f", (bill?.tip ?? 0.0))
    }
}
