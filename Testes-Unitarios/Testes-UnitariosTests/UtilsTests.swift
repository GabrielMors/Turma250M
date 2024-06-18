//
//  UtilsTests.swift
//  Testes-UnitariosTests
//
//  Created by Gabriel Mors  on 18/06/24.
//

import XCTest
@testable import Testes_Unitarios

// Função para verificar se uma string é um numero inteiro

// Função para gerar um número aleatório de 0 a um valor especifico

// Função para remover os espaços em banco no inicio e no final de um string

final class UtilsTests: XCTestCase {
    
    func testAverage() {
        let numbers = [1,2,3,4,5]
        let expected = 3
        let result = Utils.average(numbers: numbers)
        XCTAssertEqual(result, expected)
    }
    
    
}
