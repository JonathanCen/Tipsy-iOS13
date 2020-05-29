//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Jonathan Cen on 5/29/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splitAmount : String?
    var numOfPeople : String?
    var tip : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = "\(splitAmount ?? "0.0")"
        let tipConverted = String(format: "%.0f", ((Float(tip ?? "0") ?? 0.0) * 100))
        if (numOfPeople == "1" || numOfPeople == "0") {
            settingsLabel.text = "Split between \(numOfPeople ?? "1") person, with \(tipConverted)% tip."
        } else {
            settingsLabel.text = "Split between \(numOfPeople ?? "1") people, with \(tipConverted)% tip."
        }
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
