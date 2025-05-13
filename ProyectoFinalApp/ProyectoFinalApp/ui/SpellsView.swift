//
//  SpellsView.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI

struct SpellsView: View {
    @State private var spells: [Spells] = []
    @State private var isLoading = true
    
    var body: some View {
        NavigationView{
            Group{
                if isLoading{
                    ProgressView("Cargando hechizos...")
                }
                else{
                    List(spells){spell in
                        VStack(alignment: .leading, spacing: 6){
                            Text(spell.name)
                                .font(.headline)
                            if let effect = spell.use, !effect.isEmpty{
                                Text(effect)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
            .navigationTitle("Hechizos")
        }
        .onAppear{
            fetchSpells()
        }
    }
    func fetchSpells() {
        guard let url = URL(string: "https://potterapi-fedeperin.vercel.app/en/spells") else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let decoded = try JSONDecoder().decode([Spells].self, from: data)
                DispatchQueue.main.async {
                    self.spells = decoded
                    self.isLoading = false
                }
            } catch {
                print("Error decoding: \(error)")
            }
        }.resume()
    }
}

#Preview {
    SpellsView()
}
