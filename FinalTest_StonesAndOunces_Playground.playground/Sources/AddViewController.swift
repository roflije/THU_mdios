//
//  AddViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class AddViewController: UIViewController {
    // reference to MainViewController to access its variables
    var presentingVC:MainViewController?
    var ctts = [NSLayoutConstraint]()
    // storage for components
    var components:[UIView]!
    // add components programically
    var titleLabel = UILabel()
    var nameLabel = UILabel()
    var nameTF = UITextField()
    var stonesLabel = UILabel()
    var stonesTF = UITextField()
    var poundsLabel = UILabel()
    var poundsTF = UITextField()
    var ouncesLabel = UILabel()
    var ouncesTF = UITextField()

    var backBtn = UIButton(configuration: .filled(), primaryAction: nil)
    var doneBtn = UIButton(configuration: .filled(), primaryAction: nil)
    
    // sets up components
    func setUpComponents() -> Void {
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self,action:#selector(EditViewController.back(_:)), for: .touchUpInside)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.addTarget(self,action:#selector(EditViewController.done(_:)), for: .touchUpInside)
        nameLabel.text = "Name:"
        stonesLabel.text = "Stones:"
        poundsLabel.text = "Pounds:"
        ouncesLabel.text = "Ounces:"
        titleLabel.text = "Add Person"
        
        nameTF.layer.borderWidth = 0.3
        nameTF.layer.cornerRadius = 0.5
        nameTF.clipsToBounds = true

        stonesTF.layer.borderWidth = 0.3
        stonesTF.layer.cornerRadius = 0.5
        stonesTF.clipsToBounds = true
        
        poundsTF.layer.borderWidth = 0.3
        poundsTF.layer.cornerRadius = 0.5
        poundsTF.clipsToBounds = true
        
        ouncesTF.layer.borderWidth = 0.3
        ouncesTF.layer.cornerRadius = 0.5
        ouncesTF.clipsToBounds = true
        
        components = [backBtn,doneBtn,titleLabel,
            nameLabel,nameTF, stonesLabel, stonesTF, poundsLabel, poundsTF, ouncesLabel, ouncesTF,
        ]
        components.forEach { view.addSubview($0) }
    }
    // setting up constraints programically
    func setUpConstraints() {
        components.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        let sal = view.safeAreaLayoutGuide
        ctts.append(contentsOf:[
            backBtn.topAnchor.constraint(equalTo:sal.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20),
            doneBtn.topAnchor.constraint(equalTo:sal.topAnchor),
            doneBtn.trailingAnchor.constraint(equalTo:sal.trailingAnchor,constant:-20),
            titleLabel.topAnchor.constraint(equalTo:doneBtn.bottomAnchor, constant:20),
            titleLabel.centerXAnchor.constraint(equalTo:sal.centerXAnchor)
        ])
        // name label & textfield
        ctts.append(nameLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(nameLabel.trailingAnchor.constraint(equalTo:nameTF.leadingAnchor,constant:-20))
        ctts.append(nameTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(nameLabel.centerYAnchor.constraint(equalTo:nameTF.centerYAnchor))
        ctts.append(nameLabel.widthAnchor.constraint(equalTo: nameTF.widthAnchor,multiplier:0.25, constant:20))
        // stones label & textfield
        ctts.append(stonesLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(stonesLabel.trailingAnchor.constraint(equalTo:stonesTF.leadingAnchor,constant:-20))
        ctts.append(stonesTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(stonesLabel.centerYAnchor.constraint(equalTo:stonesTF.centerYAnchor))
        ctts.append(stonesLabel.widthAnchor.constraint(equalTo: stonesTF.widthAnchor,multiplier:0.25, constant:20))
        // pounds label & textfield
        ctts.append(poundsLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(poundsLabel.trailingAnchor.constraint(equalTo:poundsTF.leadingAnchor,constant:-20))
        ctts.append(poundsTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(poundsLabel.centerYAnchor.constraint(equalTo:poundsTF.centerYAnchor))
        ctts.append(poundsLabel.widthAnchor.constraint(equalTo: poundsTF.widthAnchor,multiplier:0.25, constant:20))
        // ounces label & textfield
        ctts.append(ouncesLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(ouncesLabel.trailingAnchor.constraint(equalTo:ouncesTF.leadingAnchor,constant:-20))
        ctts.append(ouncesTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(ouncesLabel.centerYAnchor.constraint(equalTo:ouncesTF.centerYAnchor))
        ctts.append(ouncesLabel.widthAnchor.constraint(equalTo: ouncesTF.widthAnchor,multiplier:0.25, constant:20))
        // top anchors and width
        ctts.append(nameLabel.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant:20))
        ctts.append(stonesLabel.topAnchor.constraint(equalTo:nameLabel.topAnchor,constant:40))
        ctts.append(stonesLabel.widthAnchor.constraint(equalTo:nameLabel.widthAnchor))
        ctts.append(stonesTF.widthAnchor.constraint(equalTo:stonesTF.widthAnchor))
        ctts.append(poundsLabel.topAnchor.constraint(equalTo:stonesLabel.topAnchor,constant:30))
        ctts.append(poundsLabel.widthAnchor.constraint(equalTo:stonesLabel.widthAnchor))
        ctts.append(poundsTF.widthAnchor.constraint(equalTo:poundsTF.widthAnchor))
        ctts.append(ouncesLabel.topAnchor.constraint(equalTo:poundsLabel.topAnchor,constant:30))
        ctts.append(ouncesLabel.widthAnchor.constraint(equalTo:poundsLabel.widthAnchor))
        ctts.append(ouncesTF.widthAnchor.constraint(equalTo:ouncesTF.widthAnchor))

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpComponents()
        setUpConstraints()
        // activate constraints
        NSLayoutConstraint.activate(ctts)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = presentingVC, let rowNumber = presentingVC?.modifiedNumber, let p = presentingVC?.people[rowNumber] {
            // fill textfields with initial data
            nameTF.text = p.name
            stonesTF.text = String(format:"%.2f",p.stones)
            poundsTF.text = String(format:"%.2f",p.pounds)
            ouncesTF.text = String(format:"%.2f",p.ounces)
        }
    }
    // "done" button onclick - save data if parseable
    @objc func done(_ sender: UIButton) -> Void {
        if let name = nameTF.text,
           let stones = Double(stonesTF.text!),
           let pounds = Double(poundsTF.text!),
           let ounces = Double(ouncesTF.text!) {
            let tempPerson = Person(_n: name, _s: stones, _p: pounds, _o: ounces)
            // add new person to both arrays (in case of clear, person will be still stored in extraPeople)
            presentingVC?.people.append(tempPerson)
            presentingVC?.extraPeople.append(tempPerson)
        }
        // sort after pressing
        switch presentingVC?.pressedSegment {
        case 1: presentingVC?.segmentNames()
        case 2: presentingVC?.segmentKilograms()
            default: break
        }
        presentingVC?.tv.reloadData()
        dismiss(animated: true,completion:nil)
    }
    
    @objc func back(_ sender: UIButton) -> Void {
        dismiss(animated: true, completion: nil)
    }
    

}
