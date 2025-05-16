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
       NavigationView {
           List(controlador.hechizos) { hechizo in
               VStack(alignment: .leading, spacing: 4) {
                   Text(hechizo.name ?? "Unknown Spell")
                       .font(.headline)
                   Text(hechizo.description ?? "Unknown Use")
                       .font(.subheadline)
                       .foregroundColor(.secondary)
               }
               .padding(.vertical, 8)
           }
           .navigationTitle("Spells")
       }
   }
}
