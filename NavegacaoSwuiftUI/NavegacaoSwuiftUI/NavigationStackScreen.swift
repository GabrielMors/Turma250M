//
//  NavigationStackScreen.swift
//  NavegacaoSwuiftUI
//
//  Created by Gabriel Mors  on 04/07/24.
//

import SwiftUI

//MARK: NavigationStack -> Contém e gerencia a navegação de multiplas vistas

//MARK: NavigationLink -> Cria links para novas vistas baseados em valores, ou seja, cria links de navegação com os valores

//MARK: NavigationDestination -> Define o que exibir para cada tipo de valor quando um NavigationLink é acionado.


struct NavigationStackScreen: View {
    
    @State var isPresented = false
    
    var body: some View {

// Agrupa todos os NavigationLink e gerencia a navegação
        NavigationStack {
            
            NavigationLink("Ir para segunda tela") {
                ScreentTwo()
            }
        // Cria links para novas vistas baseados em valor
            // Cria um link para uma cor vermelha
            NavigationLink(value: Color.red) {
                Image(systemName: "trash")
            }
            
            NavigationLink(value: "Olá mundo 1") {
                Image(systemName: "person.circle.fill")
            }
            
            NavigationLink(value: "Olá mundo 2") {
                Image(systemName: "person.circle.fill")
            }
            
            NavigationLink(value: Detail(name: "Gabriel", color: .green)) {
                Image(systemName: "person.circle")
            }
            
            NavigationLink(value: 5000, label: {
                Image(systemName: "star")
            })
            
            .navigationDestination(for: Color.self) { color in
                ZStack {
                    color
                }
            }
            
        // navigationDestination DEFINE o que deve ser exibido quando um link DO MESMO TIPO DE VALOR for acionado
            .navigationDestination(for: String.self) { text in
                Text(text)
            }
            
            .navigationDestination(for: Detail.self) { detail in
                DetailScreen(model: detail)
            }
            
            .navigationDestination(for: Int.self, destination: { value in
                Text(String(value))
            })
            
            Button("Clique aqui!!", action: {
                isPresented.toggle()
            })
            .navigationDestination(isPresented: $isPresented, destination: {
                Text("Sou a tela do botao")
            })
            
            .navigationTitle("Tela 01")
        }
    }
}

// Model
struct Detail: Hashable {
    // No UIKit, você geralmente usa IndexPath ou Identificadores manuais para gerenciar celulas e itens de listas. No SwuiftUI, voce usa o Hashable para fornecer  IDENTIDADES ÚNICA para que o framework possa diferenciar entre eles, especialmente quando os dados mudam.
    var name: String
    var color: Color
}

struct DetailScreen: View {
    
    var model: Detail
    
    var body: some View {
        ZStack {
            model.color.ignoresSafeArea()
            Text(model.name)
        }
    }
}


struct ScreentTwo: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Deuuu bom!!!")
                Button("Voltar") {
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStackScreen()
}
