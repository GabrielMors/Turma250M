//
//  main.swift
//  RevisandoPOO
//
//  Created by Gabriel Mors  on 19/03/24.
//

import Foundation

// Classe
// Trabalha com REFERÊNCIA!!!!!!!!!! REFERENCE TYPE
// Atributos / Propriedades = caracteristicas de um objeto
// Ações = funções / métodos

class Pessoa {
    
    var nome: String
    var idade: Int
    var temCabelo: Bool = true
    var esmalte: Bool?
    
    //MARK: Construtores
    // Os construtores tem a finalidade de indicar oque a sua classe necessita de uma valor incial para seu atributos
    // Caso o seu atributo naoo tenha um valor incial, vice será obrigado a passar atraves do INIT (Construtor)
    init(nome: String, idade: Int, temCabelo: Bool, esmalte: Bool? = nil) {
        self.nome = nome
        self.idade = idade
        self.temCabelo = temCabelo
        self.esmalte = esmalte
    }

    func correr() {
        print("O \(nome) está correndo!")
    }
    
    func eCareto() {
        print("O \(nome) tem cabelo: \(temCabelo)")
    }
    
}

// A partir do momento que você instancia a CLASSE se torna um OBJETO
var gabriel: Pessoa = Pessoa(nome: "Gabriel", idade: 19, temCabelo: true)
var edu: Pessoa = Pessoa(nome: "Edu", idade: 30, temCabelo: false)


gabriel = edu

print(gabriel.nome)
print(gabriel.idade)

gabriel.idade = 20

print(gabriel.idade)
print(edu.idade)


// MARK: Herança

// Classe PAI

class Animal {
    
    var nome: String
    var cor: String
    var peso: Double
    
    init(nome: String, cor: String, peso: Double) {
        self.nome = nome
        self.cor = cor
        self.peso = peso
    }
    
    func brincar() {
        print("O Cachorro \(nome) está brincando")
    }
}

// MARK: Polimorfismo
// Classe FILHA
class Cachorro: Animal {
    
    var idade: Int
    var latir: Bool
    
    init(idade: Int, latir: Bool, nome: String, cor: String, peso: Double) {
        self.idade = idade
        self.latir = latir
        super.init(nome: nome, cor: cor, peso: peso)
    }

// Reescrever a função da classe Pai
    override func brincar() {
        print("O Dono está brincando")
    }
    
}

var rex: Cachorro = Cachorro(idade: 1, latir: true, nome: "Rex", cor: "Branco", peso: 30)
rex.brincar()

// MARK: Encapsulamento

class ItemDeMercado {
    
    private var listaDeItens: [String] = []
    
    public func getListaDeItens() -> [String] {
        return listaDeItens
    }

// Variável Computada
//    var getListaDeItens: [String] {
//        return listaDeItens
//    }
    
    public func setListDeItens(item: String) {
        listaDeItens.append(item)
    }
}

var item: ItemDeMercado = ItemDeMercado()
print(item.getListaDeItens())
item.setListDeItens(item: "Melão")
print(item.getListaDeItens())



// ------------------------------------------

//MARK: Struct
// Struct trabalha com VALUE TYPE
// Não trabalha com referencia
// Struct não precisa de Init de forma explicita
// Struct não tem HERANÇA
// Struct so aceita estar em conformidade com PROTOCOLO


//class Celular {
//    var modelo: String
//    
//    init(modelo: String) {
//        self.modelo = modelo
//    }
//}


struct Celular {
    var modelo: String
}

var iphone: Celular = Celular(modelo: "iPhone 15 Pro")
var android: Celular = Celular(modelo: "Galaxy 25")

iphone = android

print(iphone.modelo)
print(android.modelo)

print("---------------")

iphone.modelo = "Xiome"
print(iphone.modelo) // Xiome
print(android.modelo) // Galaxy 25




