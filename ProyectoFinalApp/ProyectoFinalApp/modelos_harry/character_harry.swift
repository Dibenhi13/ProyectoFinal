//
//  personaje_harry.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import Foundation


struct Wand: Codable {
    let wood: String?
    let core: String?
    let length: Double?
}
 
struct Character: Codable, Identifiable {
   let id: String?
   let name: String
   let alternateNames: [String]?
   let species: String?
   let gender: String
   let house: String?
   let dateOfBirth: String?
   let yearOfBirth: Int?
   let ancestry: String?
   let eyeColour: String?
   let hairColour: String?
   let wand: Wand
   let patronus: String?
   let actor: String
   let image: String?

}

