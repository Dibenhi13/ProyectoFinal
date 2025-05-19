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
                            Image(house.rawValue)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 120)
                                .padding()
                                .background(Color.white)
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
    
    
    
    
    
    
    
    
    
    
    /*let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
     var body: some View {
         ScrollView {
             VStack(spacing: 30) {
                 ForEach(House.allCases) { house in
                     Button(action: {
                         themeManager.selectedHouse = house
                         dismiss()
                     }){
                         VStack(spacing: 12) {
                             Image(house.rawValue)
                                 .resizable()
                                 .scaledToFit()
                                 .frame(height: 120)
                                 .padding()
                                 .background(Color.white)
                                 .cornerRadius(16)
                                 .overlay(
                                     RoundedRectangle(cornerRadius: 16)
                                         .stroke(themeManager.selectedHouse == house ? house.color : Color.clear, lineWidth: 4)
                                 )
                             Text(house.displayName)
                                 .font(.headline)
                                 .foregroundColor(.primary)
                         }
                         .padding(.horizontal)
                     }
                 }
             }
             .padding(.top,30)
         }
         .navigationTitle("Choose a House")
         .background(Color(themeManager.secondaryColor).ignoresSafeArea())
     }
 }
     
     
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(House.allCases) {house in
                    Button(action: {
                        themeManager.selectedHouse = house
                        dismiss()
                    }){
     VStack(spacing: 12) {
         Image(house.rawValue)
             .resizable()
             .scaledToFit()
             .frame(height: 120)
             .padding()
             .background(Color.white)
             .cornerRadius(16)
             .overlay(
                 RoundedRectangle(cornerRadius: 16)
                     .stroke(themeManager.selectedHouse == house ? house.color : Color.clear, lineWidth: 4)
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
        .navigationTitle("Choose a House")
     .background(Color(themeManager.secondaryColor).ignoresSafeArea())
    }
}
     
*/
#Preview {
    HouseSelectionView()
}
