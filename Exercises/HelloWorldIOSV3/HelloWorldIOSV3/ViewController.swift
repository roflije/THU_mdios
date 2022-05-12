//
//  ViewController.swift
//  HelloWorldIOSV3
//
//  Created by Jeet, Chandan on 29.03.22.
//

import UIKit

class ViewController: UIViewController {
    var temp = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textviewOutlet: UITextView!
    @IBAction func buttonAction(_ sender: Any) {
        let mdate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MMM.yyyy H:mm:ss\n"
        temp += formatter.string(from: mdate)
        textviewOutlet.text = temp
    }
    
}

