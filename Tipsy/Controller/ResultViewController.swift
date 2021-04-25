//
//  ResultViewController.swift
//  Tipsy
//
//  Created by lunarian on 01/06/2020.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var billForEach : Float = 0.0
    var tip : String?
    var splitNum : Int?
    
    @IBOutlet weak var moneyPerPersonLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        moneyPerPersonLabel.text = String(format: "%.2f", billForEach)
        infoLabel.text = "\(splitNum!) customers, the tip is \(tip!)"

    }

    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
