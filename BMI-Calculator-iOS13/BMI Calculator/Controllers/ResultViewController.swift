//
//  SecondViewController.swift
//  BMI Calculator
//
//  Created by Daniel Akinniranye on 6/16/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var bmiLabel: UILabel!
    
    var advice: String?
    var bmiValue: String?
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        // code here...
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
        
    }
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
