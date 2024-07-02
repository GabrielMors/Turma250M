//
//  ContentView.swift
//  PrimeiroAppSwiftUI
//
//  Created by Gabriel Mors  on 02/07/24.
//

import SwiftUI

//MARK: VStack (Vertical Stack)
//      O VStack é o layout que empilha as visualizações verticalmente, uma em cima da outra

//MARK: HStack (Horizontal Stack)
//      O HStack é semelhante ao VStack, mas coloca as visualizações uma ao lado da outra, horizontalmente.

//MARK: ZStack (Z-index Stack)
//      O ZStack empilha as visualizações uma em ciam da outra em um plano 3D. Ou seja, de profundidade.


struct ContentView: View {
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack(spacing: 10.0) {
                HStack(spacing: 40) {
                    Text("Gabriel")
                        .background(Color.red)
                    Text("Mors")
                        .background(Color.yellow)
                }
                Text("19 anos")
                    .background(Color.blue)
            }
            .padding(60)
            .background(Color.black)
        }
        
        //            VStack {
        //                Text("Gabriel Mors")
        //                Spacer()
        //
        //                HStack {
        //                    Text("Gabriel Mors")
        //                    Spacer()
        //                    Text("Gabriel Mors")
        //                }
        //                .padding(.horizontal, 20)
        //
        //                Spacer()
        //                Text("Gabriel Mors")
        //            }
    }
}

#Preview {
    ContentView()
}
