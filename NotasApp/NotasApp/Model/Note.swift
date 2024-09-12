//
//  Note.swift
//  NotasApp
//
//  Created by Gabriel Mors  on 07/07/24.
//

import Foundation

// Identifiable: Permite que cada nota tenha um identificador ÚNICO
// Equatable: Permite comparar duas notas para verficar se sao iguais
// Codable: Permite codificar e decodificar a estrutura para JSON ou outros formatos

struct Note: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var title: String = ""
    var content: String = ""
    
    
// Uma funcao estática é uma funcao que nao precisa ser instanciada e pertence ao proprio tipo/
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.content == rhs.content
    }
}
