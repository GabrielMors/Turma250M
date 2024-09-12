//
//  ContentView.swift
//  Login-SwiftUi
//
//  Created by Gabriel Mors  on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        ZStack {
            Color.cyan.ignoresSafeArea()
            VStack(spacing: 15) {
                Text("Login")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(Color.white)
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundStyle(.white)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100)
                
                TextField("Type your email:", text: $email)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .keyboardType(.emailAddress)
                
                SecureField("Type your password:", text: $password)
                    .textFieldStyle(.roundedBorder)
                    .foregroundStyle(.black)
                    .keyboardType(.emailAddress)

                Button {
                    print("Clicou no botão")
                } label: {
                    Text("Log-in")
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 25, weight: .bold))
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack(spacing: 10) {
                    Text("Don't have an account?")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    Button {
                        print("Clicou no botão")
                    } label: {
                        Text("Register")
                            .font(.system(size: 18))
                            .foregroundStyle(.black)
                    }

                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
        
    }
}

#Preview {
    ContentView()
}
