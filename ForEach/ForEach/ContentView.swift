//
//  ContentView.swift
//  ForEach
//
//  Created by Gabriel Mors  on 09/07/24.
//

import SwiftUI

struct Person: Identifiable {
    var id: UUID = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    
    var list: [String] = ["Gabriel Mors", "Nathália neves", "Caio Fabrini"]
    
    var listPerson: [Person] = [
        Person(name: "Gabriel", age: 19),
        Person(name: "Nathália", age: 19),
        Person(name: "Caio", age: 21),
    ]
    
    var body: some View {
        // ForEach Simples
//        VStack {
//            ForEach(0..<10) { value in
//               Text("Valor -> \(value)")
//            }
//        }
        
        // ForEach com uma array de String
//        VStack {
//            ForEach(list, id: \.self) { name in
//                Text("Name -> \(name)")
//            }
//        }
        
        // ForEach com um array de Objeto
        VStack {
            ForEach(listPerson) { person in
                Text("Name -> \(person.name)")
                Text("Age -> \(person.age)")
            }
        }
    }
}

#Preview {
    ContentView()
}
