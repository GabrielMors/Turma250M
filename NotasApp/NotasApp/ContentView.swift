//
//  ContentView.swift
//  NotasApp
//
//  Created by Gabriel Mors  on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var controller = NotesController()// Observa suas mudanças
    
    @State var isGoAddNote: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($controller.notes) { $note in
                    NavigationLink {
                        //Outra tela
                    } label: {
                        HStack {
                            Image(systemName: "pencil")
                                .frame(width: 24, height: 24)
                            VStack(alignment: .leading) {
                                Text(note.title)
                                Text(note.content)
                            }
                            .font(.headline)
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    controller.deleteNote(at: indexSet)
                })
                .onMove(perform: controller.moveNote)
            }
            .navigationTitle("Notas")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Adicionar") {
                        isGoAddNote.toggle()
                    }
                }
            }
            .sheet(isPresented: $isGoAddNote) {
                // Proxima tela
            }
        }
    }
}

#Preview {
    ContentView()
}
