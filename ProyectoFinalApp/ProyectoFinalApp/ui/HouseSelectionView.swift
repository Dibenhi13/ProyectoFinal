//
//  SwiftUIView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct HouseSelectionView: View {
    @EnvironmentObject var controlador: ControladorApp
    @EnvironmentObject var themeManager: AppThemeManager
    @Environment(\.dismiss) var dismiss
    
    let houses: [House] = House.allCases
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 35){
                ForEach(House.allCases) {house in
                    Button(action: {
                        themeManager.selectedHouse = house
                        dismiss()
                    }){
                        VStack(spacing: 12) {
                            Image(house.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120)
                                .padding()
                                .background(Color.white.opacity(0.0))
                                .cornerRadius(16)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 16)
                                        .stroke(themeManager.selectedHouse == house ? house.color : Color.clear, lineWidth: 6)
                                )
                            Text(house.displayName)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(house.color)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
            
        }.navigationTitle("Choose a House")
            .background(Color(themeManager.secondaryColor).ignoresSafeArea())
    }
}
    
    
    
