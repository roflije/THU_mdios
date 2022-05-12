//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {


 var topLabel = UILabel()
var  yearsLabel = UILabel()
    var monthsLabel = UILabel()
    var daysLabel = UILabel()
    var result = UILabel()
    var button = UIButton(configuration: .filled(),primaryAction: nil)
    var yearsTextField = UILabel()
    var monthsTextField = UILabel()
    var daysTextField = UILabel()
    
     var ctts = [NSLayoutConstraint]()
    
    
    func setUPComponents() -> Void
    {
        let allComponents:[UIView] = [topLabel,yearsLabel,monthsLabel,daysLabel,result,yearsTextField,monthsTextField,daysTextField,button]
        
        let textFields:[UITextField] = [yearsTextField,monthsLabel,daysTextField]
        
        let textLabels:[UILabel] = [yearsLabel,monthsLabel,daysLabel]
        
        let allLabels = [topLabel,yearsLabel,monthsLabel,daysLabel,result]
        
        let allLabelsContents = ["My age in seconds","Years:","Months:","Days","Seconds are shown here"]
        
        // Nested functions
        
        
        
    
    
    func setUConstrains() -> Void
    {
        
        
        let sal = self.view.safeAreaLayoutGuide
        
        for v in allComponents { v.translatesAutoresizingMaskIntoConstraints = false }
        // Set the top of all lebales to 20 pixels below the
        // buttom of the previous one. Notice that top label is stuck to the top
        // of the view, and also that the top of the last label is stuck to the buttom of the button.
        
        ctts.append(topLabel.topAnchor.constraint(equalTo: sal.topAnchor))
        
        for n in 1..<allLabels.count - 1
        {
            ctts.append(allLabels[n].topAnchor.constraint(equalTo: allLabels[n-1].bottomAnchor, constant: 20))
            
        }
        
        
        button.addTarget(self, action: #selector(MyViewController.buttonAction), for: .touchUpInside)
        button.titleLabels?.font = UIFont(name: "Helvetica", size 24)
        button.setTitle("Tap here!", for: .normal)
        ctts.append(button.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        ctts.append(button.topAnchor.constraint(equalTo: daysLabel
            .bottomAnchor,constant: 20))
        ctts.append(result.topAnchor.constraint(equalTo: button.bottomAnchor,constant: 20))
        
        for v in allLabels
        {
        
            ctts.append(v.leadingAnchor.constraint(equalTo: sal.leadingAnchor, constant: 20))
        }
        
        for t in textFields
        {
            ctts.append(t.trailingAnchor.constraint(equalTo: sal.trailingAnchor constant: -20))
            t.backgroundColor = .red
    }
        for n in 0..<textLabels.count
        {
            ctts.append(textLabels[n].trailingAnchor.constraint(equalTo: textFields[n].leadingAnchor,))
        }
    }

    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
        
        @objc func buttonAction(sender:UIButton) -> Void
        {
            var tmp = yearsTextField.text!
            var seconds = 0
            if let years = Int(tmp)
            {
                seconds += years * 365 * 86400
            } else {
                
            }
            tmp = monthsLabel.text!
            if let months =  Int(tmp)
            {
                seconds += months * 30 * 86400
            }
            
        }
    }
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
    
