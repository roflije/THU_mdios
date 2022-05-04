//
//  MainViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class MainViewController: UIViewController 	 {
    var people = [Person]()
    var data = [String]()
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var clearBtn: UISegmentedControl!
    @IBOutlet weak var namesBtn: UISegmentedControl!
    @IBOutlet weak var kgBtn: UISegmentedControl!
    @IBOutlet weak var loadBtn: UISegmentedControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        let pressed = sender.selectedSegmentIndex
        switch pressed {
            case 0: segmentClear()
            case 1: segmentNames()
            case 2: segmentKilograms()
            case 3: segmentLoad()
            default: break
        }
    }
    
    func segmentClear() -> Void {
        data.removeAll()
        tv.reloadData()
    }
    func segmentNames() -> Void {
        
    }
    func segmentKilograms() -> Void {
        
    }
    func segmentLoad() -> Void {
        print("Loading segment...")
        getXML()
        print("Printing people...")
        for p in people {
            print(p.toString())
        }
    }
    
    func getXML() -> Void {
        print("Getting XML...")
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        segmentLoad()
        print("loaded!")
        // Do any additional setup after loading the view.
    }
}

