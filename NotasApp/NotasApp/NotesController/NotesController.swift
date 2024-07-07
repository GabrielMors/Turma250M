//
//  NotesController.swift
//  NotasApp
//
//  Created by Gabriel Mors  on 07/07/24.
//

import Foundation
import SwiftUI

class NotesController: ObservableObject {
    
    @Published var notes: [Note] = [] {
        didSet {
            saveNotes()
        }
    }
    
    init() {
        loadNotes()
    }
    
    func loadNotes() { // carregar as notas salvas do UserDefaults
        guard let data = UserDefaults.standard.data(forKey: "notes") else { return }
        if let getNotes = try? JSONDecoder().decode([Note].self, from: data) {
            notes = getNotes
        }
    }
    
    func saveNotes() { // Salvar as notas no UserDefaults
        if let encoded = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.setValue(encoded, forKey: "notes")
        }
    }
    
    func addNote(_ note: Note) { // Adiciona uma nova nota à lista
        notes.append(note)
    }
    
    func deleteNote(at offSets: IndexSet) { // Remove uma nota da lista
        notes.remove(atOffsets: offSets)
    }
    
    func moveNote(from source: IndexSet, to destination: Int) { // Move uma nota de uma posição para outra na lista
        notes.move(fromOffsets: source, toOffset: destination)
    }
}
