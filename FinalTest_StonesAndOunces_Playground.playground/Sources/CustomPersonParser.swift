//
//  CustomPersonParser.swift
//  FinalTest_StonesAndOunces
//
//  Created by Schneider, Patryk on 04.05.22.
//
import UIKit

class CustomPersonParser: NSObject, XMLParserDelegate {
    var stringCounter = 0
    var outerArray:Bool = false
    var innerArray:Bool = false
    var tempString:String = ""
    var tempName:String = ""
    var tempWeight = [-1.0, -1.0, -1.0]
    var people = [Person]()
    
    func getPeople() -> [Person]{
        if let path = Bundle.main.url(forResource: "data", withExtension: "xml"){
            if let parser = XMLParser(contentsOf: path){
                parser.delegate = self
                parser.parse()
            }
        }
        return people
    }
    
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        if elementName == "array" && !outerArray {
            outerArray = true
        } else {
            if elementName == "array" && outerArray{
                innerArray = true
            }
        }
    }
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "array" && innerArray {
            innerArray = false
            if tempName != "" && tempWeight[0] != -1.0 && tempWeight[1] != -1.0 && tempWeight[2] != -1.0 {
                var temporaryPerson = Person(_n: tempName, _s:tempWeight[0], _p:tempWeight[1], _o:tempWeight[2])
                people.append(temporaryPerson)
            }
            stringCounter = 0
            return
        }
        if elementName == "array" && !innerArray {
            outerArray = false
            return
        }
        if elementName == "string"{
            tempString = tempString.trimmingCharacters(in: .whitespacesAndNewlines)
            switch stringCounter {
            case 0:
                tempName = tempString
                tempString = ""
                break
            case 1:
                if let doubleValue = Double(tempString) { tempWeight[0] = doubleValue } else { tempWeight[0] = -1.0 }
                tempString = ""
                break
            case 2:
                if let doubleValue = Double(tempString) { tempWeight[1] = doubleValue } else { tempWeight[1] = -1.0 }
                tempString = ""
                break
            case 3:
                if let doubleValue = Double(tempString) { tempWeight[2] = doubleValue } else { tempWeight[2] = -1.0 }
                tempString = ""
                break
            default: print("err")
            }
            stringCounter = stringCounter + 1
        }
    }
    func parser(_ parser: XMLParser, foundCharacters data: String) {
        if (!data.isEmpty) {
            tempString += data
        }
    }
}
