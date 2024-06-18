//
//  Testes_UnitariosTests.swift
//  Testes-UnitariosTests
//
//  Created by Gabriel Mors  on 18/06/24.
//

import XCTest
@testable import Testes_Unitarios

final class Testes_UnitariosTests: XCTestCase {

    var viewController: ViewController!
    
    override func setUpWithError() throws {
        // Ele é utilizado em todo teste que quisermos configurar alguma variável, instanciar algum objeto ou fazer algo antes de cada teste.
        viewController = ViewController()
    }

    override func tearDownWithError() throws {
        // Sempre que precisarmos desalocar algum objeto ou fazer algo após cada teste.
        viewController = nil
    }

    func testExample() throws {
        let totalValor = 10 + 10
        let boleano = true
        let boleano2 = false
        XCTAssertEqual(20, totalValor)
    }
    

}
