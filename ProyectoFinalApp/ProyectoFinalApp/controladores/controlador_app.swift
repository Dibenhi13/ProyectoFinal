//
//  controlador_app.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    
    var pagina_resultados: PaginaResultado? = nil
    var personaje: Character? = nil
    
    var pagina_resultados_libros: PaginaResultadoPlaneta? = nil
    var planeta: Books? = nil
    
    init(){
        Task.detached(priority: .high){
            
            await self.descargar_monos_chinos()
            
            await self.descargar_planetas()
        }
    }
    
    //PERSONAJES
    func descargar_monos_chinos() async {
        print("Funciona por favor, estamos aqui")
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else {return}
        print(pagina_descargada)
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_info_personaje(id: Int) async {
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = mono_chino
    }
    
    func descargar_informacion_personaje(id: Int){
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    //LIBROS
    func descargar_planetas() async {
        print("Funciona por favor, estamos aqui")
        guard let pagina_descargada: PaginaResultadoPlaneta = try? await DragonBallAPI().descargar_pagina_planetas() else {return}
        print(pagina_descargada)
        self.pagina_resultados_planeta = pagina_descargada
    }
    
    func descargar_info_planetas(id: Int) async {
        guard let planeta: Planeta = try? await DragonBallAPI().descargar_informacion_planetas(id: id) else {return}
        
        self.planeta = planeta
    }
    
    func descargar_informacion_planeta(id: Int){
        Task.detached(operation: {
            await self.descargar_info_planetas(id: id)
        })
    }
}
