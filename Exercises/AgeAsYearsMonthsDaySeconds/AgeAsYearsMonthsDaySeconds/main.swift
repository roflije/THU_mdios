//
//  main.swift
//  AgeAsYearsMonthsDaySeconds
//
//  Created by Jeet, Chandan on 23.03.22.
//

import Foundation

print("Hello, World!")

var data = [0,0,0]
var temp = ""
for i in 0...2 {
    switch i {
    case 0:
        print("age", terminator: ": ")
    case 1:
        print("months",terminator:": ")
    case 2:
        print("days",terminator:": ")
    default:
        break;
    }
    temp = readLine()!
    data[i] = Int(temp)!
}

var seconds = 0
seconds += data[0] * 31536000
seconds += data[1] * 2419200
seconds += data[2] * 86400

print("Your age in seconds: \(seconds)")
