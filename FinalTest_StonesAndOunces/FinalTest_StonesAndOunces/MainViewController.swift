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
    
    // segment onclick
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
    // clear segment
    func segmentClear() -> Void {
        people.removeAll()
        tv.reloadData()
    }
    // names segment
    func segmentNames() -> Void {
        if people.isEmpty {
            getXML()
        }
        people = people.sorted(by: { $0.name < $1.name })
        tv.reloadData()
    }
    // kilograms segment
    func segmentKilograms() -> Void {
        if people.isEmpty {
            getXML()
        }
        people = people.sorted(by: { $0.getKG() < $1.getKG() })
        tv.reloadData()
    }
    // load segment
    func segmentLoad() -> Void {
        getXML()
        tv.reloadData()
    }
    
    // how many rows?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    // cell generator
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let label = UILabel(frame: CGRect(x:0, y:12.5, width: 500, height:50))
        label.text = people[indexPath[1]].name + ", " + String(format: "%.2f", people[indexPath[1]].getKG()) + " kg"
        label.sizeToFit()
        cell.addSubview(label)
        return cell
    }
    // onclick
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           print("row: \(indexPath.row)")
    }
    
    // refreshener of xml data
    func getXML() -> Void {
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
    }
}

