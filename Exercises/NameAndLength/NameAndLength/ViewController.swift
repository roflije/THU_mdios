//
//  ViewController.swift
//  NameAndLength
//
//  Created by Jeet, Chandan on 30.03.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var tv: UITextView!
    
    @IBAction func btnPressed(_ sender: Any) {
        if let name = input.text {
            let count = name.count
            tv.text =  "\(name) of count: \(count)"
        }
    }
    
    
}

