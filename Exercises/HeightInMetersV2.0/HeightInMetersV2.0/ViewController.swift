//
//  ViewController.swift
//  HeightInMetersV2.0
//
//  Created by Jeet, Chandan on 19.04.22.
//

import UIKit

class ViewController: UIViewController {
         
    @IBOutlet weak var heightCentimeters: UILabel!
    @IBOutlet weak var heightMeters: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func convertHeight(_ sender: Any) {
        
    
        
        let height = heightMeters.text!
        
        let result =  100 * Float(height)!

        
        heightCentimeters.text = String(result)

    }
    
}

