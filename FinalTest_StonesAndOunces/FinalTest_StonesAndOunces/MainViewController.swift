//
//  MainViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate	 {
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
        tv.reloadData()
    }
    
    func getXML() -> Void {
        print("Getting XML...")
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:12.5, width: 500, height:50))
        label.text = people[indexPath[1]].name + ", " + String(format: "%.2f", people[indexPath[1]].getKG()) + " kg"
        label.sizeToFit()
        cell.addSubview(label)
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 300
        }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi")
        segmentLoad()
        tv.dataSource = self
        tv.delegate = self
        
        print("loaded!")
    }
}

