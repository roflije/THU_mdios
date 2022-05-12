//
//  main.swift
//  MyHeight
//
//  Created by Jeet, Chandan on 22.03.22.
//

import Foundation

var height:Float = 0.0
print("whats ur height in meters",terminator: " : ")
var tmp = readLine()!
height = Float(tmp)!
print("ur height is \(height) meters or \(height*100) cm")
