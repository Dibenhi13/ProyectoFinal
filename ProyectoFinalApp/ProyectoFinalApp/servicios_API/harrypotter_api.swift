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

import SwiftUI

class DragonBallAPI : Codable{
    let url_base = "https://potterapi-fedeperin.vercel.app/en"
    
    //PERSONAJES
    func descargar_pagina_personajes() async -> PaginaResultado?{
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_personaje(index: Int) async -> Character?{
        let ubicacion_recurso = "/characters/\(index)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //BOOKS
    func descargar_pagina_libros() async -> PaginaResultado?{
        let ubicacion_recurso = "/books"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_libros(index: Int) async -> Books?{
        let ubicacion_recurso = "/books/\(index)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    
    //HECHIZOS
    func descargar_pagina_hechizos() async -> PaginaResultado?{
        let ubicacion_recurso = "/spells"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_hechizos(index: Int) async -> Books?{
        let ubicacion_recurso = "/spells/\(index)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //CASAS
    func descargar_pagina_casas() async -> PaginaResultado?{
        let ubicacion_recurso = "/houses"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_casas(index: Int) async -> Books?{
        let ubicacion_recurso = "/houses/\(index)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico?{
        do{
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.badUrl}
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse}
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus}
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error en tu modelo ES \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
            
        }
        
        catch ErroresDeRed.badUrl {
            print("Tienes mal la url, cambiala")
        }
        catch ErroresDeRed.badResponse {
            print("Algo salió mal con la respuesta, revisa por favor")
        }
        catch ErroresDeRed.badStatus {
            print("Como conseguiste un status de algo que ni se mueve...")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementación de este")
            print("En DragonBall API")
        }
        catch ErroresDeRed.invalidRequest{
            print("Literal quien sabe como hiciste este error")
        }
        catch{
            print("Algo terriblemente mal que no se que es, paso. No deberia pasar eso")
        }
        return nil
    }
}
