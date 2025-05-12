//
//  test.swift
//  ProyectoFinalApp
//
//  Created by alumno on 5/12/25.
//

import SwiftUI

enum House: String, CaseIterable, Identifiable {
    case gryffindor, slytherin, ravenclaw, hufflepuff
    
    var id: String {self.rawValue}
    
    var displayName: String{
        switch self{
        case .gryffindor: return "Gryffindor"
        case .slytherin: return "Slytherin"
        case .ravenclaw: return "Ravenclaw"
        case .hufflepuff: return "Hufflepuff"
        }
    }
    
    var color: Color{
        switch self{
        case .gryffindor: return Color.red
        case .slytherin: return Color.green
        case .ravenclaw: return Color.blue
        case .hufflepuff: return Color.yellow
        }
    }
    
    var secondaryColor: Color{
        switch self{
        case .gryffindor: return Color.orange
        case .slytherin: return Color.gray
        case .ravenclaw: return Color.cyan
        case .hufflepuff: return Color.brown
        }
    }
}
