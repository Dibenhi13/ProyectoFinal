//
//  CharacterDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct CharacterDetailView: View {

    @EnvironmentObject var controlador: ControladorApp
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Imagen
                if let personaje = controlador.personajeSeleccionado,
                   let imageURLString = personaje.image,
                   let imageUrl = URL(string: imageURLString) {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 300)
                            .clipped()
                            .cornerRadius(20)
                    } placeholder: {
                        Color.gray.opacity(0.2)
                            .frame(height: 300)
                            .cornerRadius(20)
                    }
                    .padding(.horizontal)
                }

                // Nombre y actor
                infoItem(label: "Name", value: character.name)
                infoItem(label: "Played by", value: character.actor)
                Divider()
                // Datos generales
                infoItem(label: "Hogwarts House", value: character.house ?? "Unknown")
                infoItem(label: "Species", value: character.species ?? "Unknown")
                infoItem(label: "Gender", value: character.gender.capitalized)
                if let sangre = character.ancestry?.capitalized {
                    infoItem(label: "Ancestry", value: sangre)
                }
                infoItem(label: "Date of Birth", value: character.dateOfBirth ?? "Unknown")

                if let year = character.yearOfBirth {
                    infoItem(label: "Year of Birth", value: "\(year)")
                }

                if let ojos = character.eyeColour?.capitalized {
                    infoItem(label: "Eye Color", value: ojos)
                }
                if let pelo = character.hairColour?.capitalized {
                    infoItem(label: "Hair Color", value: pelo)
                }

                // Varita
                Divider()
                Text("Wand")
                    .font(.headline)
                    .padding(.horizontal)
                infoItem(label: "Wood", value: character.wand.wood ?? "Unknown")
                infoItem(label: "Core", value: character.wand.core ?? "Unknown")
                if let length = character.wand.length {
                    infoItem(label: "Length", value: "\(length) inches")
                }

                // Patronus
                if let patronus = character.patronus?.capitalized {
                    infoItem(label: "Patronus", value: patronus)
                }
            }
            .padding()
        }
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.white)
    }


    func infoItem(label: String, value: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.body)
                .foregroundColor(.black)
            Divider().background(Color.gray.opacity(0.3))
        }
        .padding(.horizontal)
    }
}
 
 
