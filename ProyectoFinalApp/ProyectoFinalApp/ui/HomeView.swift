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
            ZStack{
                Color(themeManager.secondaryColor)
                    .ignoresSafeArea()
                
                VStack(spacing: 40){
                    Spacer()
                    
                    Image("logoAPP")
                        .resizable()
                        .scaledToFit()
                    
                    Text("Potter Head")
                        .font(.system(size:36, weight: .bold, design: .serif))
                        .foregroundColor(themeManager.primaryColor)
                    Spacer()
                    
                    NavigationLink(destination: HouseSelectionView()){
                        Text("Select a House")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth:240)
                            .background(themeManager.primaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(12)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color("NeutralBackground").ignoresSafeArea())
            }
        }
    }
}
