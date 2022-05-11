//
//  EditViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class EditViewController: UIViewController {
    var person:Person?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var weightTF: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        if let p = person {
            nameLabel.text = p.name
            weightTF.text = "\(p.getKG())"
        }
    }
    
    @IBAction func back(_ sender: Any) {
        if let p = person {
            weightTF.text = "\(p.getKG())"
        }
        self.dismiss(animated: true)
    }
    @IBAction func done(_ sender: Any) {
    }
    

}

