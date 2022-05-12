//
//  main.swift
//  ReadMyAge
//
//  Created by Jeet, Chandan on 22.03.22.
//

import Foundation


var name = ""
var lengthOfMyName = 0

print("type ur name: ", terminator: " : ")
name = readLine()!
lengthOfMyName = name.count
print("ur name is \(name) and it is \(lengthOfMyName) letters long")
