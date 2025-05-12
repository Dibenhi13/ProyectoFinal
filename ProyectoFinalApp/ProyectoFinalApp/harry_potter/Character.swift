//
//  personaje_harry.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

struct Character: /*Identifiable,*/ Codable {
    let index: Int
    let fullName: String
    let nickname: String
    let hogwartsHouse: String
    let interpretedBy: String
    let birthdate: String
    let image: String
    
}
