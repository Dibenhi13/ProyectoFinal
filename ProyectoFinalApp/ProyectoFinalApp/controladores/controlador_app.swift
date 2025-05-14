//
//  controlador_app.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI
class ControladorApp: ObservableObject {
   @Published var perfil_a_mostrar: Usuario? = Usuario(
       username: "Harry123",
       name: "Dibenhi Garza",
       email: "harry123@hogwarts.com"
   )
   @Published var personajes: [Character] = []
   @Published var personajeSeleccionado: Character? = nil
   @Published var libros: [Books] = []
   @Published var libroSeleccionado: Books? = nil
   @Published var hechizos: [Spells] = []
   @Published var hechizoSeleccionado: Spells? = nil
   @Published var casas: [Houses] = []
   @Published var casaSeleccionada: Houses? = nil
   private let api = HarryPotterAPI()
   init() {
       Task {
           await descargarPersonajes()
           await descargarLibros()
           await descargarHechizos()
           await descargarCasas()
       }
   }
   // DESCARGAS
   func descargarPersonajes() async {
       print("Descargando personajes...")
       if let resultado = await api.descargarPersonajes() {
           await MainActor.run { self.personajes = resultado }
       } else {
           print("Error al descargar personajes")
       }
   }
   func descargarLibros() async {
       if let resultado = await api.descargarLibros() {
           await MainActor.run { self.libros = resultado }
       } else {
           print("Error al descargar libros")
       }
   }
   func descargarHechizos() async {
       if let resultado = await api.descargarHechizos() {
           await MainActor.run { self.hechizos = resultado }
       } else {
           print("Error al descargar hechizos")
       }
   }
   func descargarCasas() async {
       if let resultado = await api.descargarCasas() {
           await MainActor.run { self.casas = resultado }
       } else {
           print("Error al descargar casas")
       }
   }
   // SELECCIÓN
   func seleccionarPersonaje(_ personaje: Character) {
       self.personajeSeleccionado = personaje
   }
   func seleccionarLibro(_ libro: Books) {
       self.libroSeleccionado = libro
   }
   func seleccionarHechizo(_ hechizo: Spells) {
       self.hechizoSeleccionado = hechizo
   }
   func seleccionarCasa(_ casa: Houses) {
       self.casaSeleccionada = casa
   }
}
