//
//  controlador_app.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI
@MainActor

class ControladorApp: ObservableObject {
    @Published var perfil_a_mostrar: Usuario? = Usuario(
        username: "Harry123",
        name: "Dibenhi Garza",
        email: "harry123@hogwarts.com"
    )
    
    var personajes: [Character] = []
    var libros: [Books] = []
    var hechizos: [Spells] = []
    var personajeSeleccionado: Character? = nil
    var libroSeleccionado: Books? = nil
    
    private let api = HarryPotterAPI()
    
    init() {
        Task.detached(priority: .high) {
            await self.cargarPersonajes()
            await self.cargarLibros()
            await self.cargarHechizos()
        }
    }
    
    //PERSONAJES
    func cargarPersonajes() async {
        if let descargados = await api.descargarPersonajes() {
            self.personajes = descargados
        }
    }
    
    func cargarDetallePersonaje(id: String) {
        Task {
            self.personajeSeleccionado = await api.descargarInfoPersonajes(id: id)
        }
    }
    //LIBROS
    func cargarLibros() async {
        if let descargados = await api.descargarLibros() {
            self.libros = descargados
        }
    }
    
    func cargarDetalleLibro(id: String) {
        Task {
            self.libroSeleccionado = await api.descargarInfoLibros(id: id)
        }
    }
    
    
    //HECHIZOS
    func cargarHechizos() async {
        if let descargados = await api.descargarHechizos() {
            self.hechizos = descargados
        }
    }
}

