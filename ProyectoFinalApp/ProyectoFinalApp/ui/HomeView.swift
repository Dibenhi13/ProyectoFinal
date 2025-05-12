//
//  HomeView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var themeManager: AppThemeManager
    
    var body: some View{
        NavigationView{
            VStack(spacing: 40){
                Text("Potter Head")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(themeManager.primaryColor)
                
                NavigationLink(destination: HouseSelectionView()){
                    Text("Select a House")
                        .font(.title2)
                        .padding()
                        .background(themeManager.primaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("NeutralBackgroud").ignoresSafeArea())
        }
    }
}
