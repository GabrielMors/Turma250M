import UIKit

//MARK: NÃO SE ESQUEÇA DO SIGNIFICADO DE CADA UM EMMMMM



//MARK: Decodable
// Descodifica-lo, ou seja, tornar  um tipo de JSON para um objeto

//MARK: Encodable
// Codificá-lo, ou seja, tornar um tipo de dado no Swift em JSON

//MARK: Codable
// Codifica como também Decodifica


struct Person: Encodable, Decodable {
    var name: String?
    var age: Int?
    var lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name_App"
        case age = "age_App"
        case lastName = "last_Name"
    }
}

// CODIFICAÇÃO -> (Encoding)
let person = Person(name: "Otávio", age: 23, lastName: "Astrath")
let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted

do {
    let jsonData = try jsonEncoder.encode(person) // Transformando nosso objeto em um dado (Binário -> 00011011010101010)
    if let jsonString = String(data: jsonData, encoding: .utf8) {
//     print("JSON CODIFICADO:")
//        print(jsonString)
    }
} catch {
   print("Erro ao codificar em JSON: \(error)")
}


// DECODIFICAÇÃO (Decoding)
let jsonString = """
{
    "name_App": "Gabriel",
    "age_App": 19,
    "last_Name": "Mors"
}
"""

let jsonDecoder = JSONDecoder()

if let jsonData = jsonString.data(using: .utf8) {
    
    do {
        let decodedPerson: Person = try jsonDecoder.decode(Person.self, from: jsonData)
        print("Decodificado:")
        print("Name: \(decodedPerson.name ?? ""), age: \(decodedPerson.age ?? 0), lastName:ame: \(decodedPerson.lastName ?? "")")
    } catch {
        print("Erro ao decodificar JSON: \(error)")
    }
}




