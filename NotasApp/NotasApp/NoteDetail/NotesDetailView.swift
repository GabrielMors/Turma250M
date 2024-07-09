//
//  NotesDetailView.swift
//  NotasApp
//
//  Created by Gabriel Mors  on 09/07/24.
//

import SwiftUI

struct NotesDetailView: View {
    
    @Binding var note: Note
    @State var noteState: Note // Estado local para armazenar o estado atual da nota
    @State var disabled: Bool = true
    @Environment(\.dismiss) var dismiss
    
    init(note: Binding<Note>) {
        _note = note // Inicializa o binding para a note
        _noteState = State(initialValue: note.wrappedValue) // Inicializa o estado local com o valor atual da nota
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Título", text: $noteState.title)
                .font(.title)
            
            TextEditor(text: $noteState.content)
                .font(.subheadline)
        }
        .padding()
        .navigationTitle("Detalhes")
        
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Salvar") {
                    note = noteState
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    return NavigationStack {
        @State var note = Note(title: "Olá Mundo", content: "Esse é o detalhe do mundo")
        NotesDetailView(note: $note)
    }
}
