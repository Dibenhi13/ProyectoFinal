//
//  SpellsView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import Foundation
import SwiftUI

struct SpellsView: View {
    @EnvironmentObject var controlador: ControladorApp
    @EnvironmentObject var themeManager: AppThemeManager
    
    
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 16){
                    ForEach(controlador.hechizos){ hechizo in
                        HStack(spacing: 16){
                            VStack(alignment: .leading, spacing: 4) {
                                Text(hechizo.name ?? "Unknown Spell")
                                    .font(.headline)
                                    .foregroundColor(.primary)
                                Text(hechizo.description ?? "Unknown Use")
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
                .padding(.top)
            }
            .background(themeManager.secondaryColor.ignoresSafeArea())
            .navigationTitle("Spells")
        }
    }
}

