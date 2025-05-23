//
//  Usuario.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/13/25.
//

import SwiftUI
import Foundation

struct Usuario: Identifiable, Codable{
    let id: UUID = UUID()
    let username: String
    let name: String
    let email: String
}
