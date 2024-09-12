//
//  ContentView.swift
//  NavegacaoSwuiftUI
//
//  Created by Gabriel Mors  on 04/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var isPresented: Bool = false
    @State var isPresentedFullScreen: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Apresentar Sheet") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented, content: {
                SheetView()
            })
            
            Button("Apresentar Sheet Full Screen") {
                isPresentedFullScreen.toggle()
            }
            .fullScreenCover(isPresented: $isPresentedFullScreen, content: {
                SheetView()
            })
        }
    }
}

struct SheetView: View {
    
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
    ContentView()
}
