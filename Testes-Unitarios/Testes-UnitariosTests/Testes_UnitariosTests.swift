//
//  Testes_UnitariosTests.swift
//  Testes-UnitariosTests
//
//  Created by Gabriel Mors  on 18/06/24.
//

import XCTest
@testable import Testes_Unitarios

final class Testes_UnitariosTests: XCTestCase {

    var viewController: Casa!
    
    // Como se fosse o viewDidLoad do teste
    override func setUpWithError() throws {
        // Ele é utilizado em todo teste que quisermos configurar alguma variável, instanciar algum objeto ou fazer algo antes de cada teste.
        viewController = Casa()
    }

    // Como se fosse o viewDidDesappear do teste
    override func tearDownWithError() throws {
        // Sempre que precisarmos desalocar algum objeto ou fazer algo após cada teste.
        viewController = nil
    }

    func testExample() throws {
        let totalValor = 10 + 10
        XCTAssertEqual(20, totalValor)
    }
    
    func testExampleTwo() throws {
        XCTAssertFalse(viewController.name == "Gabriel")
    }
    
}

struct Casa {
    var name: String = "minha casa"
}
