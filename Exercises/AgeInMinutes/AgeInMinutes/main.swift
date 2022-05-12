//
//  main.swift
//  AgeInMinutes
//
//  Created by Jeet, Chandan on 22.03.22.
//

import Foundation

var age = 0
var minutes = 0
print("whats ur age",terminator: " : ")
var tmp = readLine()!
age = Int(tmp)!
print("ur age is: \(age) years or \(age*365*24*60) minutes")

