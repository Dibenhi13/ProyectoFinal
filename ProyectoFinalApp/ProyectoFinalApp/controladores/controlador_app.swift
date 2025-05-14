//
//  controlador_app.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI


public class ControladorApp: ObservableObject {
    //USUARIO
   @Published var perfil_a_mostrar: Usuario? = Usuario(
        username: "Harry123",
        name: "Dibenhi Garza",
        email: "harry123@hogwarts.com"
    )
    
    
   // PERSONAJES
    @Published var personajes: [Character] = []
    @Published var personajeSeleccionado: Character? = nil
   // LIBROS
    @Published var libros: [Books] = []
    @Published var libroSeleccionado: Books? = nil
   // HECHIZOS
    @Published var hechizos: [Spells] = []
    @Published var hechizoSeleccionado: Spells? = nil
   // CASAS
    @Published var casas: [Houses] = []
    @Published var casaSeleccionada: Houses? = nil
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
