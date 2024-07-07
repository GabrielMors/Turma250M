//
//  Binding.swift
//  PrimeiroAppSwiftUI
//
//  Created by Gabriel Mors  on 07/07/24.
//

import SwiftUI

// @Binding -> é usado para criar uma ligação entre uma propriedade de uma view pai e uma view filho. Isso permite que a view filho leia e atualize a propriedade original da view pai, mantendo-as sincronizadas. É útil quando você deseja que as mudanças em uma view filho afetem a view pai.

struct BindingView: View {
    
    @State private var isToggled = false
    @State private var isShowingChildView = false
    
    var body: some View {
        VStack {
            Text("Toggle Example")
            
            Toggle(isOn: $isToggled) {
                Text("Toggle")
            }
            .padding()
            
            Button("Show Child View") {
                self.isShowingChildView.toggle()
            }
            .sheet(isPresented: $isShowingChildView, content: {
                ChildView(isToggled: $isToggled)
            })
            
        }
    }
}

struct ChildView: View {
    
    @Binding var isToggled: Bool
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("Child View")
                
                Text(isToggled ? "Toggle is ON" : "Toggle is OFF")
                    .padding()
                
                Button("Toggle") {
                    self.isToggled.toggle()
                }
                .padding()
            }
            .background(Color.green)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    BindingView()
}
