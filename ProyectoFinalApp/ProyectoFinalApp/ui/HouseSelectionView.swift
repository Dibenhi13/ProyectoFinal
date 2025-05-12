//
//  SwiftUIView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct HouseSelectionView: View {
    @EnvironmentObject var themeManager: AppThemeManager
    @Environment(\.dismiss) var dismiss
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View{
        ScrollView{
            LazyVGrid(columns: columns, spacing: 20){
                ForEach(House.allCases) {house in
                    Button(action: {
                        themeManager.selectedHouse = house
                        dismiss()
                    }){
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
        .background(Color("NeutralBackground").ignoresSafeArea())
    }
}

#Preview {
    HouseSelectionView()
}
