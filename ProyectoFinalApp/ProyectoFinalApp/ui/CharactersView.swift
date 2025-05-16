//
//  CharactersView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import Foundation
import SwiftUI

import SwiftUI
 
struct CharactersView: View {
    @EnvironmentObject var controlador: ControladorApp
    
    var body: some View {
        NavigationStack {
            List(controlador.personajes) { character in
                NavigationLink(destination: CharacterDetailView(character: character)) {
                    HStack {
                        if let imageURLString = character.image, let url = URL(string: imageURLString){
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            VStack(alignment: .leading) {
                                Text(character.name)
                                    .font(.headline)
                                Text(character.house ?? "Unknown house")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("Characters")
        }
        .task {
            await controlador.cargarPersonajes()
        }
    }
}


#Preview {
   CharactersView()
       .environmentObject(ControladorApp())
}

