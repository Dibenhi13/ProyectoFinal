//
//  CharacterDetailView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                if let imageUrl = character.image, let url = URL(string: imageUrl){
                    AsyncImage(url: url){ image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder:{
                        Color.gray
                    }
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                Text(character.fullName)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Group{
                    infoRow(label: "Full Name", value: character.fullName)
                    infoRow(label: "Nickname", value: character.nickname)
                    infoRow(label: "Hogwarts House", value: character.hogwartsHouse)
                    infoRow(label: "Interpreted By", value: character.interpretedBy)
                    infoRow(label: "Birthdate", value: character.birthdate)
                }
            }
            .padding()
        }
        .navigationTitle(character.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    @ViewBuilder
    func infoRow(label: String, value: String?) -> some View {
        if let value = value, !value.isEmpty{
            HStack{
                Text("\(label):")
                    .fontWeight(.bold)
                Spacer()
                Text(value)
                    .foregroundColor(.secondary)
            }
            .padding(.vertical, 2)
        }
    }
}

