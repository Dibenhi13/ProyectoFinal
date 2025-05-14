//
//  CharactersView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//
import Foundation
import SwiftUI
struct CharactersView: View {
    @EnvironmentObject var controlador: ControladorApp
    
    @State private var isLoading = true
    var body: some View {
        NavigationView {
            Group {
                List(controlador.personajes) { character in
                    NavigationLink(destination: CharacterDetailView(character: character)) {
                        HStack {
                            AsyncImage(url: URL(string: character.image ?? "")) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                Color.gray
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(character.fullName)
                                    .font(.headline)
                                if let house = character.hogwartsHouse {
                                    Text(house)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }
                }
            }
        }
        .navigationTitle("Personajes")
    }
}


#Preview {
   CharactersView()
       .environmentObject(ControladorApp())
}
