//
//  MainViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate	 {
    // Variables
    var people = [Person]() // stores people from XML + Added
    var extraPeople = [Person]() // stores added people (in case of clear/reload from XML)
    var modifiedNumber:Int? // stores which row has been tapped
    var editViewOrAddView:Bool? // used to differeniate between jumping to edit view controller or add view controller
    var pressedSegment = 0 // set to 0 on start
    // Outlets
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var clearBtn: UISegmentedControl!
    @IBOutlet weak var namesBtn: UISegmentedControl!
    @IBOutlet weak var kgBtn: UISegmentedControl!
    @IBOutlet weak var loadBtn: UISegmentedControl!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    // Segment onClick - calls proper function depending on which segment has been pressed
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        pressedSegment = sender.selectedSegmentIndex
        switch pressedSegment {
            case 0: segmentClear()
            case 1: segmentNames()
            case 2: segmentKilograms()
            case 3: segmentLoad()
            default: break
        }
    }
    // clear segment - clear & reload tableview
    func segmentClear() -> Void {
        people.removeAll()
        tv.reloadData()
    }
    // names segment - fetches data if people array is empty and sorts them by name
    func segmentNames() -> Void {
        if people.isEmpty {
            getXML()
        }
        people = people.sorted(by: { $0.name < $1.name })
        tv.reloadData()
    }
    // kilograms segment - fetches data if people array is empty and sorts them by kg
    func segmentKilograms() -> Void {
        if people.isEmpty {
            getXML()
        }
        people = people.sorted(by: { $0.getKG() < $1.getKG() })
        tv.reloadData()
    }
    // load segment - loads data from xml
    func segmentLoad() -> Void {
        getXML()
        tv.reloadData()
    }
    
    // how many rows for tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    // cell generator for tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellReuseIdentifier")
        let rowNumber = indexPath.row
        cell.textLabel?.text = people[rowNumber].name
        cell.detailTextLabel?.text = String( format: "%.2f", people[rowNumber].getKG()) + " kg"
        return cell
    }
    // onclick for rows - saves row number and jumps to EditView
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.modifiedNumber = indexPath.row
        editViewOrAddView = true
        performSegue(withIdentifier: "JumpToEditView", sender: people[modifiedNumber!])
        
    }
    // onclick for add button - jumps to AddView
    @IBAction func onClickAdd(_ sender: Any) {
        editViewOrAddView = false
        performSegue(withIdentifier: "JumpToAddView", sender: nil)
    }
    // preparation for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if editViewOrAddView! {
            let evc = segue.destination as! EditViewController
            evc.person = sender as? Person
        } else {
            let avc = segue.destination as! AddViewController
        }
    }
    // return from EditView - modify person if data from textfield can be parsed
    @IBAction func returnFromEditViewController(_ segue:UIStoryboardSegue)->Void {
        let evc = segue.source as! EditViewController
        if let stones = Double(evc.stonesTF.text!),
           let pounds = Double(evc.poundsTF.text!),
           let ounces = Double(evc.ouncesTF.text!),
           let index = modifiedNumber {
            people[index].stones = Double(stones)
            people[index].pounds = Double(pounds)
            people[index].ounces = Double(ounces)
        }
        switch pressedSegment {
            case 1: segmentNames()
            case 2: segmentKilograms()
            default: break
        }
        tv.reloadData()
    }
    // return from AddView - add person if data from textfield can be parsed
    @IBAction func returnFromAddViewController(_ segue:UIStoryboardSegue)->Void {
        let avc = segue.source as! AddViewController
        if let stones = Double(avc.stonesTF.text!),
           let pounds = Double(avc.poundsTF.text!),
           let ounces = Double(avc.ouncesTF.text!),
           let name = avc.nameInput.text {
            let tempPerson = Person(_n: name, _s: Double(stones), _p: Double(pounds), _o: Double(ounces))
            extraPeople.append(tempPerson)
            people.append(tempPerson)
        }
        switch pressedSegment {
            case 1: segmentNames()
            case 2: segmentKilograms()
            default: break
        }
        tv.reloadData()
    }
    // refreshener of xml data
    func getXML() -> Void {
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
        if !extraPeople.isEmpty {
            people.append(contentsOf: extraPeople)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tv.dataSource = self
        tv.delegate = self
    }
}


// JumpToEditView
// JumpToAddView
