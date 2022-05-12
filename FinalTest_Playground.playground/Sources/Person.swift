//
//  Person.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

// note: same as in project - read there!
import Foundation

struct Person {
    init(_n:String, _s:Double, _p:Double, _o:Double) {
        self.name = _n
        self.stones = _s
        self.pounds = _p
        self.ounces = _o
    }
    var name:String
    
    var stones:Double
    
    var pounds:Double
    
    var ounces:Double
    
    
    func getOunces() -> Double {
        return (stones*14*16) + (pounds * 16) + (ounces)
    }
    func getKG() -> Double {
        var res:Double = 0.0
        res += (stones*14*16) + (pounds * 16) + (ounces)
        res = res * 28.3495
        res = res / 1000
        return res;
    }
    
    func toString() -> String {
        return "\(name) | \(self.getKG())kg"
    }

    func isEmpty() -> Bool {
        if name == "" || stones == -1.0 || pounds == -1.0 || ounces == -1.0 {
            return true
        }
        return false
    }
}
