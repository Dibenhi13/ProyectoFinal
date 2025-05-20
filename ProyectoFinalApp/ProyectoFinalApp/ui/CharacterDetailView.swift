//
//  CharacterDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct CharacterDetailView: View {
    
    @EnvironmentObject var controlador: ControladorApp
    @EnvironmentObject var themeManager: AppThemeManager
    
    let character: Character
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                // Imagen
                if let imageURL = character.image, let url = URL(string: imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 320, height: 350)
                            .clipped()
                            .cornerRadius(20)
                    } placeholder: {
                        Color.gray.opacity(0.3)
                            .frame(height: 280)
                            .cornerRadius(20)
                    }
                }
                
                VStack(alignment: .leading, spacing: 12) {
                    Text(character.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Divider().background(.white.opacity(0.3))
                    
                    Group {
                        infoRow("House", character.house)
                        infoRow("Species", character.species)
                        infoRow("Gender", character.gender)
                        infoRow("Ancestry", character.ancestry)
                        infoRow("Date of Birth", character.dateOfBirth)
                        infoRow("Eye Color", character.eyeColour)
                        infoRow("Hair Color", character.hairColour)
                    }
                    
                    Divider().background(.white.opacity(0.3))
                    Text("Wand")
                        .font(.headline)
                        .foregroundColor(.white)
                    infoRow("Wood", character.wand.wood ?? "Unknown")
                    infoRow("Core", character.wand.core ?? "Unknown")
                    if let length = character.wand.length {
                        infoRow("Length", "\(length) inches")
                    }
                    
                    
                    if let patronus = character.patronus, !patronus.isEmpty {
                        Divider().background(.white.opacity(0.3))
                        infoRow("Patronus", patronus)
                    }
                }
                .padding()
                .background(themeManager.primaryColor)
                .cornerRadius(20)
                .padding(.horizontal)
                .shadow(radius: 5)
            }
            .padding(.bottom)
        }
        .background(themeManager.secondaryColor.ignoresSafeArea())
        .navigationTitle(character.name)
    }
    
    //FUNCION DE INFOROW
    
    func infoRow(_ title: String, _ value: String?) -> some View {
        HStack {
            Text(title + ":")
                .foregroundColor(.white)
                .fontWeight(.semibold)
            Spacer()
            Text(value ?? "Unknown")
                .foregroundColor(.white.opacity(0.9))
        }
        .font(.subheadline)
    }
}
 
