//
//  ViewController.swift
//  ListOfNames
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class ViewController: UIViewController {
    var model = [String]()
    
    @IBOutlet weak var tv: UITextView!
    
    @IBAction func clear(_ sender: Any) {
        tv.text = ""
    }
    @IBAction func sort(_ sender: Any) {
        if !model.isEmpty {
            model.sort()
            tv.text = model.joined(separator:"\n")
        }
    }
    @IBAction func load(_ sender: Any) {
        self.loadTheText()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tv.text = model.joined(separator: "\n")
    }
    
    func loadTheText() -> Void {
        if let urlofTextFile = Bundle.main.url(forResource: "names", withExtension: "txt") {
            do {
                let tmp = try String(contentsOf: urlofTextFile)
                let lines = tmp.components(separatedBy: "\n").filter { !$0.isEmpty }
                model.removeAll()
                model.append(contentsOf: lines)
            } catch {
                print("ERR")
            }
        }
        tv.text = model.joined(separator: "\n")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadTheText()
        // Do any additional setup after loading the view.
    }

    
}

