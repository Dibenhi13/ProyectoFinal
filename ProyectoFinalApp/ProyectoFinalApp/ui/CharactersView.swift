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
    @EnvironmentObject var themeManager: AppThemeManager
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(controlador.personajes) { character in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
                            HStack(spacing: 16) {
                                // Imagen circular
                                if let imageURL = character.image, let url = URL(string: imageURL) {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } placeholder: {
                                        Color.gray.opacity(0.2)
                                    }
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                                } else {
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 60, height: 60)
                                }
                                // Info de personaje
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(character.name)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text(character.house ?? "Unknown house")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                                Spacer()
                            }
                            .padding()
                            .background(themeManager.primaryColor.opacity(0.6))
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .background(themeManager.secondaryColor.ignoresSafeArea()) // Fondo de página
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

/*var body: some View {
 NavigationStack {
     //List(controlador.personajes) { character in
     ScrollView{
         LazyVStack(spacing: 16){
             ForEach(controlador.personajes){ character in
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
                             VStack(alignment: .leading, spacing: 4) {
                                 Text(character.name)
                                     .font(.headline)
                                     .foregroundColor(.primary)
                                 Text(character.house ?? "Unknown house")
                                     .font(.subheadline)
                                     .foregroundColor(.secondary)
                             }
                             Spacer()
                         }
                         
                     }
                     .padding(.vertical, 5)
                     .background(themeManager.secondaryColor.opacity(0.2))
                                                .cornerRadius(16)
                                                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                 }
             }
             .navigationTitle("Characters")
         }
         .task {
             await controlador.cargarPersonajes()
         }
     }
 }
}
}*/
