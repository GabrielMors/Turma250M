//
//  main.swift
//  Classes
//
//  Created by Gabriel Mors  on 14/03/24.
//

import Foundation

class Pessoa {
    
    var nome: String?
    var sobrenome: String?
    var altura: Double?
    var idade: Int?
    
    init(nome: String?, sobrenome: String?, altura: Double?, idade: Int?) {
        self.nome = nome
        self.sobrenome = sobrenome
        self.altura = altura
        self.idade = idade
    }
    
    func imprimirPessoa() {
        print(self.nome ?? "Sem nome")
        print(self.sobrenome ?? "Sem nome")
        print(self.idade ?? "Sem nome")
    }
}

var pessoa = Pessoa(nome: "Gabriel", sobrenome: "Mors", altura: 1.75, idade: 19)
pessoa.imprimirPessoa()

var otavio = Pessoa(nome: "Otavio", sobrenome: "Sei la", altura: 1.80, idade: 23)
otavio.imprimirPessoa()



class Carro {
    var modelo: String = "Civic"
    var ano: Int = 2022
    
    func digirir() {
        print("Meu \(modelo) do ano \(ano) esta digirindo sozinho")
    }
}

var carro = Carro()
var carro2 = Carro()

print(carro.digirir())
print(carro.modelo)








