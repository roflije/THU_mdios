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
    var weightLabel = UILabel()
    var weightTF = UITextField()

    var backBtn = UIButton(configuration: .filled(), primaryAction: nil)
    var doneBtn = UIButton(configuration: .filled(), primaryAction: nil)
    
    func setUpComponents() -> Void {
        backBtn.setTitle("Back", for: .normal)
        backBtn.addTarget(self,action:#selector(EditViewController.back(_:)), for: .touchUpInside)
        doneBtn.setTitle("Done", for: .normal)
        doneBtn.addTarget(self,action:#selector(EditViewController.done(_:)), for: .touchUpInside)
        nameLabel.text = "Name"
        weightLabel.text = "Weight"
        titleLabel.text = "Detail View"
        components = [backBtn,doneBtn,titleLabel,
            nameLabel,nameLabel2, weightLabel,weightTF,
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
        //ctts.append(nameLabel2.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -20))
        ctts.append(nameLabel.centerYAnchor.constraint(equalTo:nameLabel2.centerYAnchor))
        ctts.append(nameLabel.widthAnchor.constraint(equalTo: nameLabel2.widthAnchor,multiplier:0.25, constant:20))
                    
        ctts.append(weightLabel.leadingAnchor.constraint(equalTo:sal.leadingAnchor,constant:20))
        ctts.append(weightLabel.trailingAnchor.constraint(equalTo:weightTF.leadingAnchor,constant:-20))
        //ctts.append(weightTF.trailingAnchor.constraint(equalTo:sal.trailingAnchor, constant: -20))
        ctts.append(weightLabel.centerYAnchor.constraint(equalTo:weightTF.centerYAnchor))
        ctts.append(weightLabel.widthAnchor.constraint(equalTo: weightTF.widthAnchor,multiplier:0.25, constant:20))
        
        ctts.append(nameLabel.topAnchor.constraint(equalTo:titleLabel.bottomAnchor,constant:20))
        ctts.append(weightLabel.topAnchor.constraint(equalTo:nameLabel.topAnchor,constant:20))
        ctts.append(weightLabel.widthAnchor.constraint(equalTo:nameLabel.widthAnchor))
        ctts.append(weightTF.widthAnchor.constraint(equalTo:weightTF.widthAnchor))

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
            weightTF.text = String(format:"%.2f",p.getKG()) + " kg"
        }
    }
    
    @objc func done(_ sender: UIButton) -> Void {
        if var weight = Int(weightTF.text!), let index = presentingVC?.modifiedNumber {
            weight = weight * 1000
            var ounces = Double(weight) / 28.3495
            let stones = Int(ounces / (16*14))
            ounces = ounces - Double(stones * (16*14) )
            let pounds = Int(ounces / 16)
            ounces = ounces - Double(pounds * 16 )
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
