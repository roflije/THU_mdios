//
//  EditViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class EditViewController: UIViewController {
    // reference to passed person object (to fill label and textfields initially)
    var person:Person?
    // outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var stonesTF: UITextField!
    @IBOutlet weak var poundsTF: UITextField!
    @IBOutlet weak var ouncesTF: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        if let p = person {
            nameLabel.text = p.name
            stonesTF.text = "\(p.stones)"
            poundsTF.text = "\(p.pounds)"
            ouncesTF.text = "\(p.ounces)"
        }
    }
    // if back button is pressed then set back the data to the original values
    @IBAction func back(_ sender: Any) {
        if let p = person {
            print(p.toString())
            stonesTF.text = "\(p.stones)"
            poundsTF.text = "\(p.pounds)"
            ouncesTF.text = "\(p.ounces)"
        }
        self.dismiss(animated: true)
    }
    @IBAction func done(_ sender: Any) {
    }
    

}

