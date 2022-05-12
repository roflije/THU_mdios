//
//  ViewController.swift
//  ThreeButtonsOneAction
//
//  Created by Jeet, Chandan on 30.03.22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var tv: UITextView!
    
    let df = DateFormatter()
    private var format = [UIButton:String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.format[button1] = "d.M.yyyy\n"
        self.format[button2] = "H:mm:ss\n"
        self.format[button3] = "d.M.yyyy H:mm:ss\n"
    }

    @IBAction func generalAction(_ sender: UIButton){
        df.dateFormat = format[sender]
        self.tv.text.append(df.string(from: Date()))
    }

}

