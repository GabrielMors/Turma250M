//
//  ContentView.swift
//  Form
//
//  Created by Gabriel Mors  on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var name: String = ""
    @State var email: String = ""
    @State var feedback: String = ""
    @State var nota: Float = 0
    @State var isPresented: Bool = false
    
    var body: some View {
        VStack {
            Form {
                Section {
                    HStack {
                        Image(systemName: "person.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundStyle(.gray)
                        
                        TextField("Name:", text: $name)
                    }
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .frame(width: 25, height: 20)
                            .foregroundStyle(.gray)
                        
                        TextField("Email:", text: $email)
                    }
                } header: {
                    Text("Informações do usuário")
                }
                
                Section {
                    ZStack {
                        if feedback.isEmpty {
                            Text("Digite seu feedback aqui...")
                                .foregroundStyle(.gray)
                        }
                        TextEditor(text: $feedback)
                    }
                } header: {
                    Text("FeedBack")
                }

                Section {
                    HStack {
                        Text("1")
                        Slider(value: $nota, in: 1...10, step: 1)
                        Text("10")
                            .padding(.horizontal)
                        Text("Nota: \(Int(nota))")
                    }
                    
                } header: {
                    Text("Nota")
                }
                
                Section {
                    Button("Enviar Feedback") {
                        isPresented.toggle()
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 40)
                    .background(isDisabled ? Color.gray : Color.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .disabled(isDisabled)
                }
            }
            .navigationTitle("Formulário de feedbacks")
            .alert("Enviar Feedback", isPresented: $isPresented) {
                Button("Enviar") {
                    
                }
            }
        }
    }
    
    var isDisabled: Bool {
        return name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}

#Preview {
    ContentView()
}
