//
//  AddNoteView.swift
//  NotasApp
//
//  Created by Gabriel Mors  on 09/07/24.
//

import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.dismiss) var dismiss //Variável de ambiente para demissão da view
    @ObservedObject var controller: NotesController // Objeto observado do tipo NotesController
    @State var note = Note() // Estado para armazenar um nova nota
    
    var body: some View {
        Form {
            Section {
                TextField("Informe um título", text: $note.title)
            } header: {
                Text("Título")
            }
            
            Section {
                TextEditor(text: $note.content)
            } header: {
                Text("Conteúdo")
            }
            
            Section {
                Button("Salvar") {
                    controller.notes.append(note)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let controller = NotesController() // Cria uma instancia de NotesController para PRÉ-VISUALIZAÇÃO
    return AddNoteView(controller: controller)
}
