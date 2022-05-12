//
//  main.swift
//  pondsToKilograms
//
//  Created by Jeet, Chandan on 23.03.22.
//

import Foundation

var weight = [Double(0), Double(0), Double(0)]
var res:Double = 0.00
let poundsPerStone = Double(14)
let ouncesPerPound = Double(16)
let gramsPerPound = 453.592
let gramsPerOunce = 28.3495
var readTemp = ""
for i in 0...2{
    switch i {
    case 0:
        print("weight in stones", terminator: ": ")
    case 1:
        print("weight in ounces", terminator: ": ")
    case 2:
        print("weight in pounds", terminator: ": ")
    default:
        break;
    }
    readTemp = readLine()!
    weight [ i ] = Double(readTemp)!

    
}

res += weight[0] * poundsPerStone * ouncesPerPound
res += weight[1] * ouncesPerPound
res += weight[2]

res = res * gramsPerOunce / 1000
print("Weight in kg: \(res)")

 
