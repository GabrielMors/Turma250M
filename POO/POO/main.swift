//
//  main.swift
//  POO
//
//  Created by Gabriel Mors  on 17/03/24.
//


// FINALIZAR O CURSO DO SWIFT DESCOMBLICADO

import Foundation


// A principal caracteristica de uma Classe, é que ela trabalha com REFERÊNCIA

// Escapsulamento
// Abstração
// Herança

class Pessoa {
    
    internal var name: String
    private var lastName: String
    public var age: Int
    
    init(name: String, lastName: String, age: Int) {
        self.name = name
        self.lastName = lastName
        self.age = age
    }
    
    func getLastName() -> String {
        print(lastName)
        return lastName
    }
    
    func correr() -> Void {
        print("O \(name) está correndo")
    }
    
    
}

// INSTÂNCIA
var gabrielMors: Pessoa = Pessoa(name: "Gabriel", lastName: "Mors", age: 19)
gabrielMors.getLastName()
print(gabrielMors.name)

// REFERÊNCIA
var otavio: Pessoa?
print(otavio?.name)



// MARK: Herança

class Pai {
    
    var name: String
    var lastName: String
    
    init(name: String, lastName: String) {
        self.name = name
        self.lastName = lastName
    }
    
    func imprimirNome() {
        print("Meu nome é \(name)")
    }
}


class Filha: Pai {
    // Poliforfismo
    override func imprimirNome() {
        print("Eu sou a classe filha")
    }
    
}

var filha = Filha(name: "Maria", lastName: "Souza")
filha.imprimirNome()




class Eduardo {
    
    var name: String = "Eduardo"
    var lastName: String = "Assis"
    
    func imprimirNome() {
        print("Meu nome é \(name) \(lastName)")
    }
}


class Gabriel {
    
    var name: String = "Gabriel"
    var lastName: String = "Mors"
    
    func imprimirNome() {
        print("Meu nome é \(name) \(lastName)")
    }
}

var gabriel = Gabriel()
var eduardo = Eduardo()

gabriel.name = "Gab"
eduardo.name = "Edu"

print(gabriel.name) // Gab
print(eduardo.name) // Edu

gabriel.name = eduardo.name

print(gabriel.name) // Edu
print(eduardo.name) // Edu

print(gabriel.lastName) // Mors
print(eduardo.lastName) // Assis


// Struct

struct Veiculo {
    
    var modelo: String
    var ano: Int
    
    
}

var carro = Veiculo(modelo: "Porsche", ano: 2019)



