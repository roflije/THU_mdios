//
//  AddViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var weightInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        nameInput.text = ""
        weightInput.text = "dont parse me"
    }
    
    @IBAction func Done(_ sender: Any) {
    }
}

