//
//  placeholder_api.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 4/2/25.
//

import Foundation

class HarryPotterAPI {
   let url_base = "https://potterapi-fedeperin.vercel.app/en"
   // PERSONAJES
   func descargarPersonajes() async -> [Character]? {
       await descargar(recurso: "/characters")
   }
   // LIBROS
   func descargarLibros() async -> [Books]? {
       await descargar(recurso: "/books")
   }
   // HECHIZOS
   func descargarHechizos() async -> [Spells]? {
       await descargar(recurso: "/spells")
   }
   // CASAS
   func descargarCasas() async -> [Houses]? {
       await descargar(recurso: "/houses")
   }
   // DESCARGA GENÉRICA
   private func descargar<T: Codable>(recurso: String) async -> T? {
       guard let url = URL(string: "\(url_base)\(recurso)") else {
           print("URL inválida: \(url_base)\(recurso)")
           return nil
       }
       do {
           let (data, _) = try await URLSession.shared.data(from: url)
           let decoded = try JSONDecoder().decode(T.self, from: data)
           return decoded
       } catch {
           print("Error al decodificar \(recurso): \(error)")
           return nil
       }
   }
}
