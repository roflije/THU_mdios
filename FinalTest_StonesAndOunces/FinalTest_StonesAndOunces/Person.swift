//
//  Person.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 03.05.22.
//

import Foundation

struct Person {
    var name:String
    var stones:Float
    var pounds:Float
    var ounces:Float
    
    func getOunces() -> Float {
        return (stones*14*16) + (pounds * 16) + (ounces)
    }
    func getKG() -> Float {
        var res:Float = 0.0
        res += (stones*14*16) + (pounds * 16) + (ounces)
        res = res * 28.3495
        res = res / 1000
        return res;
    }
    
    func isHeavierKG(cmp:Float) -> Bool {
        if(self.getKG() < cmp) { return false; }
        return true;
    }
    
    func isHeavierOunces(cmp:Float) -> Bool {
        if(self.getOunces() < cmp) { return false; }
        return true;
    }
}
