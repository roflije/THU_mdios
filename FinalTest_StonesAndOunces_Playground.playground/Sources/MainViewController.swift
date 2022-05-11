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

    var ctts = [NSLayoutConstraint]()
    func setUpComponents() -> Void {
        tv.dataSource = self
        tv.delegate = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        sc.translatesAutoresizingMaskIntoConstraints = false
        sc.addTarget(self, action: #selector(MainViewController.segmentedAction(_:)), for: .valueChanged)
        // Thisis part 1 of using a given cell type
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "CellReuseIdentifier")
        //
        // We need to do this, otherwise Clear will only work after clicking some other segment
        //
        sc.selectedSegmentIndex = -1
        view.addSubview(tv)
        view.addSubview(sc)
    }
    func setUpConstraints() -> Void {
        let sal = view.safeAreaLayoutGuide
        ctts.append(contentsOf:[
            sc.topAnchor.constraint(equalTo: sal.topAnchor, constant:20),
            sc.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant:20),
            sc.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant: -20),
            tv.topAnchor.constraint(equalTo: sc.bottomAnchor, constant: 20),
            tv.leadingAnchor.constraint(equalTo: sal.leadingAnchor,constant:20),
            tv.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant:  -20),
            tv.bottomAnchor.constraint(equalTo: sal.bottomAnchor, constant:-20),
        ])
        NSLayoutConstraint.activate(ctts)
    }
    
    // segment onclick
    @IBAction func segmentedAction(_ sender: UISegmentedControl) {
        print("clicked")
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
    
    // how many rows?
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }
    // cell generator
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellReuseIdentifier")
        let rowNumber = indexPath.row
        cell.textLabel?.text = people[rowNumber].name
        cell.detailTextLabel?.text = String( format: "%.2f", people[rowNumber].getKG()) + " kg"
        return cell
    }
    // onclick for rows
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.modifiedNumber = indexPath.row
        let presentedVC = EditViewController()
        presentedVC.modalTransitionStyle = .coverVertical
        presentedVC.modalPresentationStyle = .fullScreen
        presentedVC.presentingVC = self // This is the dependency injection
        present(presentedVC, animated: true)
    }

    
    // refreshener of xml data
    func getXML() -> Void {
        let customParser = CustomPersonParser()
        people = customParser.getPeople()
        if !extraPeople.isEmpty {
            people.append(contentsOf: extraPeople)
        }
    }
    
    func showToast(message : String, font: UIFont) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.font = font
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponents()
        setUpConstraints()
    }
}


// JumpToEditView
// JumpToAddView
