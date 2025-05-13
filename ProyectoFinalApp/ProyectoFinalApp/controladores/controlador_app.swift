//
//  controlador_app.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI
@Observable
@MainActor

public class ControladorApp: ObservableObject {
    //USUARIO
   var perfil_a_mostrar: Usuario? = Usuario(
        id: 00013,
        username: "Harry123",
        name: "Dibenhi Garza",
        email: "harry123@hogwarts.com"
    )
    
    
   // PERSONAJES
   var personajes: [Character] = []
   var personajeSeleccionado: Character? = nil
   // LIBROS
   var libros: [Books] = []
   var libroSeleccionado: Books? = nil
   // HECHIZOS
   var hechizos: [Spells] = []
   var hechizoSeleccionado: Spells? = nil
   // CASAS
   var casas: [Houses] = []
   var casaSeleccionada: Houses? = nil
   init() {
       Task.detached(priority: .high) {
           await self.descargarPersonajes()
           await self.descargarLibros()
           await self.descargarHechizos()
           await self.descargarCasas()
       }
   }
   // DESCARGAR LISTAS COMPLETAS
   func descargarPersonajes() async {
       guard let resultado = await HarryPotterAPI().descargarPersonajes() else { return }
       self.personajes = resultado
   }
   func descargarLibros() async {
       guard let resultado = await HarryPotterAPI().descargarLibros() else { return }
       self.libros = resultado
   }
   func descargarHechizos() async {
       guard let resultado = await HarryPotterAPI().descargarHechizos() else { return }
       self.hechizos = resultado
   }
   func descargarCasas() async {
       guard let resultado = await HarryPotterAPI().descargarCasas() else { return }
       self.casas = resultado
   }
   // SELECCIONAR DETALLE
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
