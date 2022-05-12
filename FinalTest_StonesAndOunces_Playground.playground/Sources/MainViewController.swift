//
//  MainViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

public class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate     {
    var people = [Person]()
    var extraPeople = [Person]()
    var data = [String]()
    var modifiedNumber:Int?
    var pressedSegment = 0
    
    var tv = UITableView()
    var sc = UISegmentedControl(items: ["Clear", "Names", "Kilograms","Load"])
    var addBtn = UIButton(configuration: .filled(), primaryAction: nil)

    
    var ctts = [NSLayoutConstraint]()
    func setUpComponents() -> Void {
        addBtn.setTitle("Add", for: .normal)
        addBtn.addTarget(self,action:#selector(MainViewController.add(_:)), for: .touchUpInside)
        
        tv.dataSource = self
        tv.delegate = self
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(MainViewController.segmentedAction(_:)), for: .valueChanged)
        // Thisis part 1 of using a given cell type
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "CellReuseIdentifier")
        sc.selectedSegmentIndex = -1
        
        view.addSubview(addBtn)
        view.addSubview(tv)
        view.addSubview(sc)
    }
    func setUpConstraints() -> Void {
        let sal = view.safeAreaLayoutGuide
        ctts.append(contentsOf:[
            addBtn.bottomAnchor.constraint(equalTo: sal.bottomAnchor, constant:-80),
            addBtn.centerXAnchor.constraint(equalTo:sal.centerXAnchor),

            sc.topAnchor.constraint(equalTo: sal.topAnchor, constant:20),
            sc.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant:20),
            sc.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant: -20),
            tv.topAnchor.constraint(equalTo: sc.bottomAnchor, constant: 20),
            tv.leadingAnchor.constraint(equalTo: sal.leadingAnchor,constant:20),
            tv.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant:  -20),
            tv.bottomAnchor.constraint(equalTo: addBtn.topAnchor, constant:-20),
            
        ])
        NSLayoutConstraint.activate(ctts)
    }
    
    // segment onclick
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
    
    // how many rows for TableView?
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    // cell generator for TableView
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellReuseIdentifier")
        let rowNumber = indexPath.row
        cell.textLabel?.text = people[rowNumber].name
        cell.detailTextLabel?.text = String( format: "%.2f", people[rowNumber].getKG()) + " kg"
        return cell
    }
    // onclick for TableView rows
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.modifiedNumber = indexPath.row
        let presentedVC = EditViewController()
        presentedVC.modalTransitionStyle = .coverVertical
        presentedVC.modalPresentationStyle = .fullScreen
        presentedVC.presentingVC = self // This is the dependency injection
        present(presentedVC, animated: true)
    }
    // onClick for "Add" Button
    @objc func add(_ sender: UIButton) -> Void {
        let presentedVC = AddViewController()
        presentedVC.modalTransitionStyle = .coverVertical
        presentedVC.modalPresentationStyle = .fullScreen
        presentedVC.presentingVC = self // This is the dependency injection
        present(presentedVC, animated: true)
    }
    
    // refreshener of xml data
    func getXML() -> Void {
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
        // Load customly added people
        if !extraPeople.isEmpty {
            people.append(contentsOf: extraPeople)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponents()
        setUpConstraints()
    }
}


// JumpToEditView
// JumpToAddView
