//
//  pagina_resultados.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

struct Meta: Codable{
    let totalItems: Int
    let itemCount: Int
    let itemsPerPage: Int
    let totalPages: Int
    let currentPage: Int
}

struct Enlaces: Codable{
    let first: String
    let previous: String
    let next: String
    let last: String
}


import SwiftUI

struct PaginaResultado: Codable { 
    
    let items: [Character]
    let meta: Meta
    let links: Enlaces
}

struct PaginaResultadoPlaneta: Codable { //, Identifiable {
    //var id = self.meta.currentPage
    
    let items: [Planeta]
    let meta: Meta
    let links: Enlaces
}

/*protocol ItemAPI: Identifiable, Codable{
    var id: Int {get set}
}
*/
