//
//  EditViewController.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import UIKit

class EditViewController: UIViewController {
    var presentingVC:MainViewController?
    var ctts = [NSLayoutConstraint]()
    
    var components:[UIView]!

    var titleLabel = UILabel()
    var nameLabel = UILabel()
    var nameLabel2 = UILabel()
    var stonesLabel = UILabel()
    var stonesTF = UITextField()
    var poundsLabel = UILabel()
    var poundsTF = UITextField()
    var ouncesLabel = UILabel()
    var ouncesTF = UITextField()

    var backBtn = UIButton(configuration: .filled(), primaryAction: nil)
    var doneBtn = UIButton(configuration: .filled(), primaryAction: nil)
    
    func setUpComponents() -> Void {
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self,action:#selector(EditViewController.back(_:)), for: .touchUpInside)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.addTarget(self,action:#selector(EditViewController.done(_:)), for: .touchUpInside)
        nameLabel.text = "Name:"
        stonesLabel.text = "Stones:"
        poundsLabel.text = "Pounds:"
        ouncesLabel.text = "Ounces:"
        titleLabel.text = "Detail View"
        
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
            nameLabel,nameLabel2, stonesLabel, stonesTF, poundsLabel, poundsTF, ouncesLabel, ouncesTF,
        ]
        components.forEach { view.addSubview($0) }
    }
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
        
        ctts.append(nameLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(nameLabel.trailingAnchor.constraint(equalTo:nameLabel2.leadingAnchor,constant:-20))
        ctts.append(nameLabel2.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(nameLabel.centerYAnchor.constraint(equalTo:nameLabel2.centerYAnchor))
        ctts.append(nameLabel.widthAnchor.constraint(equalTo: nameLabel2.widthAnchor,multiplier:0.25, constant:20))
                    
        ctts.append(stonesLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(stonesLabel.trailingAnchor.constraint(equalTo:stonesTF.leadingAnchor,constant:-20))
        ctts.append(stonesTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(stonesLabel.centerYAnchor.constraint(equalTo:stonesTF.centerYAnchor))
        ctts.append(stonesLabel.widthAnchor.constraint(equalTo: stonesTF.widthAnchor,multiplier:0.25, constant:20))
        
        ctts.append(poundsLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(poundsLabel.trailingAnchor.constraint(equalTo:poundsTF.leadingAnchor,constant:-20))
        ctts.append(poundsTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(poundsLabel.centerYAnchor.constraint(equalTo:poundsTF.centerYAnchor))
        ctts.append(poundsLabel.widthAnchor.constraint(equalTo: poundsTF.widthAnchor,multiplier:0.25, constant:20))
        
        ctts.append(ouncesLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(ouncesLabel.trailingAnchor.constraint(equalTo:ouncesTF.leadingAnchor,constant:-20))
        ctts.append(ouncesTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -200))
        ctts.append(ouncesLabel.centerYAnchor.constraint(equalTo:ouncesTF.centerYAnchor))
        ctts.append(ouncesLabel.widthAnchor.constraint(equalTo: ouncesTF.widthAnchor,multiplier:0.25, constant:20))
        
        
        
        
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
        NSLayoutConstraint.activate(ctts)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let _ = presentingVC, let rowNumber = presentingVC?.modifiedNumber, let p = presentingVC?.people[rowNumber] {
            nameLabel2.text = p.name
            stonesTF.text = String(format:"%.2f",p.stones)
            poundsTF.text = String(format:"%.2f",p.pounds)
            ouncesTF.text = String(format:"%.2f",p.ounces)
        }
    }
    
    @objc func done(_ sender: UIButton) -> Void {
        if let stones = Double(stonesTF.text!),
           let pounds = Double(poundsTF.text!),
           let ounces = Double(ouncesTF.text!),
           let index = presentingVC?.modifiedNumber {
            presentingVC?.people[index].stones = Double(stones)
            presentingVC?.people[index].pounds = Double(pounds)
            presentingVC?.people[index].ounces = Double(ounces)
        }
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
