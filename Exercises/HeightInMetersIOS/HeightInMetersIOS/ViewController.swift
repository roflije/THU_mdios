//
//  ViewController.swift
//  HeightInMetersIOS
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
    @IBOutlet weak var textview: UITextView!

    @IBAction func btn(_ sender: Any) {
        if let inputField = input?.text,
           let height = Float(inputField){
            let result = height * 100
            textview.text = "\(result)"
        }else{
            textview.text = "Sorryy number invalid"
            textview.selectAll(nil)
        }
        self.view.endEditing(true)
    }
}

