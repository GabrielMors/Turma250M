//
//  Utils.swift
//  Testes-Unitarios
//
//  Created by Gabriel Mors  on 18/06/24.
//

import Foundation

class Utils {
    
    static func average(numbers: [Int]) -> Int {
    //Exemplo01
//        var total = 0
//        for number in numbers {
//            total = total + number
//        }
//        return total / numbers.count
        
    //Exemplo02
        return numbers.reduce(0, +) / numbers.count
    }
    
    static func isInteger(_ str: String) -> Bool {
//        if let _ = Int(str) {
//            return true
//        } else {
//            return false
//        }
        
        return Int(str) != nil
    }
    
    static func trimWhitespace(_ str: String) -> String {
        return str.trimmingCharacters(in: .whitespaces)
    }
    
    static func randomInRange(upperBound: Int) -> Int {
        print(Int.random(in: 0...upperBound))
        return Int.random(in: 0...upperBound)
    }
}
