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
    
    var body: some View {
        NavigationView{
            Group{
                List(controlador.hechizos){spell in
                    VStack(alignment: .leading, spacing: 6){
                        Text(spell.spell)
                            .font(.headline)
                        Text(spell.use)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .navigationTitle("Hechizos")
    }
}
    

#Preview {
    SpellsView()
}
