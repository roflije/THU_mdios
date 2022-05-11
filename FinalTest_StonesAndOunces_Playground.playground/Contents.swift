//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

let mvc = MainViewController()
mvc.view.frame = CGRect(x: 0, y: 0, width: 512, height: 768)
PlaygroundPage.current.liveView = mvc
