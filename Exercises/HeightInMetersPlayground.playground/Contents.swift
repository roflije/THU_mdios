//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    
    
    var topLabel:UILabel!
    var nameTextField:UITextField!
    var button:UIButton!
    var nameLabel:UILabel!
    var result:UILabel!
    var resultDescription:UILabel!
    //The constrains
    //
    //
    
    var myConstraints:[NSLayoutConstraint]!
    //
    // Auxiliary methods
    //
    
    
    func addCompontents() -> Void {
        //toplabel
        topLabel = UILabel()
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        topLabel.text  = "Please type your height in meters:"
        topLabel.textAlignment = .center
        
        //text field
        nameTextField = UITextField()
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.textAlignment = .center
        nameTextField.borderStyle = .bezel
        nameTextField.placeholder = "Height in Meters"
        //btn
        button = UIButton(configuration: .filled(),primaryAction: nil)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TAP here!", for: .normal)
        button.addTarget(self, action: #selector(MyViewController.buttonAction), for: .touchUpInside)
        // result description
        resultDescription = UILabel()
        resultDescription.translatesAutoresizingMaskIntoConstraints = false
        resultDescription.text = "Your height in centimeters:"
        resultDescription.textAlignment = .center
        //result
        result = UILabel()
        result.translatesAutoresizingMaskIntoConstraints = false
        result.text = "0"
        result.textAlignment = .center
        
        //Add items to the view
        
        self.view.addSubview(topLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(button)
        self.view.addSubview(resultDescription)
        self.view.addSubview(result)
        
    }
    
    @objc func buttonAction(sender:UIButton) -> Void {
        if let name = nameTextField?.text,
           var  height = Float(name){
            if height < 0  {
                height = height * (-1)
                result.text = "Invalid Value"
                print("xd")
            } else {
                let resultInCentimeters =  height * 100
                
                result.text = "\(resultInCentimeters)"
                
            }
        }
        else {
            result.text = "Garbage is not accepted"
            nameTextField.selectAll(nil)
        }
        self.view.endEditing(true)
    }
    
    func setUpConstrains() -> Void {
        
        let sal = self.view.safeAreaLayoutGuide
        myConstraints = [topLabel.topAnchor.constraint(equalTo: sal.topAnchor,constant: 24),
                         topLabel.centerXAnchor.constraint(equalTo: sal.centerXAnchor),
                         nameTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 20),
                         nameTextField.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant: 16),
                         nameTextField.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant: -16),
                         button.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20.0),
                         button.centerXAnchor.constraint(equalTo: sal.centerXAnchor),
                         resultDescription.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20.0),
                         resultDescription.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant: 16),
                         resultDescription.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant: -16),
                         result.topAnchor.constraint(equalTo: resultDescription.bottomAnchor, constant: 20),
                         result.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant: 16),
                         result.trailingAnchor.constraint(equalTo: sal.trailingAnchor, constant: -16),
        ]
        
    }
    
    override func loadView() {
        super.loadView()
        
        self.view.frame = CGRect(x:0, y: 0, width: 512, height: 342)
        
        self.addCompontents()
        self.setUpConstrains()
        
        NSLayoutConstraint.activate(myConstraints!)
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
