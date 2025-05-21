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
        case .gryffindor: return Color(red: 181/255, green: 51/255, blue: 36/255)
        case .slytherin: return Color(red: 96/255, green: 125/255, blue: 81/255)
        case .ravenclaw: return Color(red: 5/255, green: 38/255, blue: 89/255)
        case .hufflepuff: return Color(red: 119/255, green: 61/255, blue: 3/255)
        }
    }
    
    var secondaryColor: Color{
        switch self{
        case .gryffindor: return Color(red: 229/255, green: 166/255, blue: 87/255)
        case .slytherin: return Color(red: 211/255, green: 220/255, blue: 186/255)
        case .ravenclaw: return Color(red: 193/255, green: 232/255, blue: 255/255)
        case .hufflepuff: return Color(red: 250/255, green: 227/255, blue: 111/255)
        }
    }
    
    var imageName: String{
        switch self {
        case .gryffindor: return "gryffindorImage"
        case .slytherin: return "slytherinImage"
        case .ravenclaw: return "ravenclawImage"
        case .hufflepuff: return "hufflepuffImage"
        }
    }
}
