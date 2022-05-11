//
//  AddViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var stonesTF: UITextField!
    @IBOutlet weak var poundsTF: UITextField!
    @IBOutlet weak var ouncesTF: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cancel(_ sender: Any) {
        nameInput.text = ""
        stonesTF.text = "dont parse me"
        poundsTF.text = "dont parse me"
        ouncesTF.text = "dont parse me"
    }
    
    @IBAction func Done(_ sender: Any) {
    }
}

