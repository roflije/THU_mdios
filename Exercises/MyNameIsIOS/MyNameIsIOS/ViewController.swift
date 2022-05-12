//
//  ViewController.swift
//  MyNameIsIOS
//
//  Created by Jeet, Chandan on 29.03.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var lab: UILabel!
    @IBAction func button(_ sender: Any) {
        lab.text = input.text
    }
    
}

