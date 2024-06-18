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
}
